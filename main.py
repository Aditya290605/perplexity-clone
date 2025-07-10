import asyncio
from fastapi import FastAPI, WebSocket
from fastapi.staticfiles import StaticFiles
from fastapi.responses import FileResponse
from fastapi.middleware.cors import CORSMiddleware

from pydantic_model.chat_body import ChatBody
from services.llm_service import LLMService
from services.sort_service import SortSourceService
from services.serach_service import SearchService

app = FastAPI()

# Allow CORS for frontend if hosted separately
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  # For development. Change to specific domain in prod.
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Serve Flutter Web build (you must put build/web output into ./web directory)
app.mount("/", StaticFiles(directory="web", html=True), name="web")

search_service = SearchService()
sort_source_service = SortSourceService()
llm_service = LLMService()

# WebSocket endpoint
@app.websocket("/ws/chat")
async def websocket_chat_endpoint(websocket: WebSocket):
    await websocket.accept()
    try:
        await asyncio.sleep(0.1)
        data = await websocket.receive_json()
        query = data.get("query")

        search_results = search_service.web_search(query)
        sorted_results = sort_source_service.sort_sources(query, search_results)

        await asyncio.sleep(0.1)
        await websocket.send_json({"type": "search_result", "data": sorted_results})

        for chunk in llm_service.generate_response(query, sorted_results):
            await asyncio.sleep(0.1)
            await websocket.send_json({"type": "content", "data": chunk})
    except Exception as e:
        print(f"Unexpected error occurred: {e}")
    finally:
        await websocket.close()

# REST POST endpoint
@app.post("/chat")
def chat_endpoint(body: ChatBody):
    search_results = search_service.web_search(body.query)
    sorted_results = sort_source_service.sort_sources(body.query, search_results)
    response = llm_service.generate_response(body.query, sorted_results)
    return response

# Fallback route to serve Flutter index.html if not matched by above routes
@app.get("/")
def serve_index():
    return FileResponse("web/index.html")

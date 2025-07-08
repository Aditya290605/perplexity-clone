from fastapi import FastAPI

from services.serach_service import SearchService
from pydantic_model.chat_body import ChatBody


app = FastAPI()

serach_service = SearchService()

@app.post("/")
def chat_endpoint(body:ChatBody):
    return serach_service.web_search(query=body.query)
    
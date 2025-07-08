from fastapi import FastAPI

from pydantic_model.chat_body import ChatBody


app = FastAPI()

@app.post("/")
def sendResponse(body:ChatBody):
    print(body.query)
    return body.query
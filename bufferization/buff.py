from fastapi import FastAPI

app = FastAPI(
    title="Buffer Service",
    description="First service example for bufferization",
    version="1.0.0"
)


@app.get("/")
async def root():
    return {"message": "Hello World", "service": "web_server_one"}


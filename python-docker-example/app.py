from fastapi import FastAPI

app = FastAPI(
    title="App Service",
    description="Second service example",
    version="1.0.0"
)


@app.get("/")
async def root():
    return {"message": "Hello World", "service": "web_server_two"}


import time
import sys
from fastapi import FastAPI
print("Сообщение в stdout")  # stdout
sys.stderr.write("Сообщение в stderr\n")  # stderr

time.sleep(2)  # Имитация долгой работы
print("Ещё одно сообщение в stdout")
print(sys.version)


app = FastAPI()


@app.get("/")
async def root():
    return {"message": "Hello World"}


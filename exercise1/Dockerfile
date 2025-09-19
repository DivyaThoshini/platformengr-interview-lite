FROM python:3.10-slim
WORKDIR /exercises
RUN useradd -ms /bin/bash bonkey
USER bonkey
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY helloworld.py .
EXPOSE 80
CMD ["python", "helloworld.py"]

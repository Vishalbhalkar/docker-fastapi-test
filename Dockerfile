FROM python:3.10

# Set the working directory inside the container to `/app`
WORKDIR /app

# Copy only the requirements.txt file first to install dependencies
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy everything from your local machine to the container (including `app` folder and `data` folder)
COPY . .

# Start FastAPI with uvicorn, looking for `main.py` inside the `app` folder
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]

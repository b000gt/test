FROM python:alpine3.13
ENV PYTHONUNBUFFERED=1
COPY requirements.txt .
RUN pip install -r requirements.txt
COPY testproject ./testproject
WORKDIR /testproject
RUN python manage.py migrate

EXPOSE 8080:8080

ENTRYPOINT [ "python", "manage.py", "runserver" , "0.0.0.0:8080"]
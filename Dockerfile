FROM python:3.12-slim

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

WORKDIR /app

# Usuario sin privilegios para no correr como root
RUN addgroup --system app && adduser --system --ingroup app app \
    && chown app:app /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY --chown=app:app . .

USER app

EXPOSE 8000

HEALTHCHECK --interval=30s --timeout=5s --start-period=15s --retries=3 \
    CMD python -c "import urllib.request; urllib.request.urlopen('http://localhost:8000/health/', timeout=3)" || exit 1

CMD ["sh", "-c", "python manage.py migrate --noinput && exec gunicorn demo.wsgi:application --bind 0.0.0.0:8000 --workers 2"]

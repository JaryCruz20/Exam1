# Usa una imagen oficial de Python
FROM python:3.10-slim

# Establece el directorio de trabajo
WORKDIR /app

# Copia los archivos necesarios al contenedor
COPY . /app

# Instala las dependencias
RUN pip install flask psycopg2-binary

# Crea la carpeta de templates y static si no existen
RUN mkdir -p templates static

# Mueve los archivos al lugar correcto si es necesario
RUN [ -f index.html ] && mv index.html templates/index.html || true
RUN [ -f styles.css ] && mv styles.css static/styles.css || true

# Expone el puerto que usará Flask
EXPOSE 5000

# Comando para iniciar la app
CMD ["python", "app.py"]

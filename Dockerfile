FROM python:3.10

# Crear directorio de trabajo
WORKDIR /app

# Copiar archivos
COPY . .

# Instalar dependencias
RUN pip install --upgrade pip
RUN pip install rasa

# Entrenamiento del modelo (opcional)
RUN rasa train

# Exponer el puerto por donde escucha Rasa
EXPOSE 5005

# Comando para ejecutar Rasa en modo API
CMD ["rasa", "run", "--enable-api", "--cors", "*", "--debug"]

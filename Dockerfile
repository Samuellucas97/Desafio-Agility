FROM alpine:3.3

RUN apk --no-cache add py-pip libpq python-dev curl

RUN pip install --upgrade pip # Linha adicionada por mim para corrigir o problema na versão do pip

RUN wget https://bootstrap.pypa.io/pip/2.7/get-pip.py &&  python get-pip.py # Linha adicionado por mim pois a execução do comando abaixo pedia uma biblioteca chamada typing. Para isso, baixei e instalei ela 

RUN pip install flask==0.10.1 python-consul

ADD / /app

WORKDIR /app

HEALTHCHECK CMD curl --fail http://localhost:5000/health || exit 1

CMD python app.py & python admin.py

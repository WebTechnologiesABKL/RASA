FROM python:3.10-slim

RUN python -m pip install rasa[spacy]

RUN python -m pip install spacy[displacy]

RUN python -m spacy download de_core_news_lg

RUN python -m pip install rasa-addons

RUN python -m pip install duckling_http_extractor

COPY . .

RUN python -m pip install -r requirements.txt

RUN rasa train

ENTRYPOINT ["rasa"]

CMD ["run", "--enable-api", "--port", "5005"]

EXPOSE 5005
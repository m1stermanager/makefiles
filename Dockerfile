from alpine:3.7

COPY ./app.o /go/app.o
CMD /go/app.o
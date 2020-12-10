FROM arm32v6/python:3.7.9-alpine

ARG city
ENV CITY_ENV=${city}
ARG n_samples
ENV SAMPLES_ENV=${n_samples}
ARG n_epochs
ENV EPOCHS_ENV=${n_epochs}

WORKDIR /usr/src/app

COPY LSTM.py /
COPY torch-1.4.0-cp37-cp37m-linux_armv7l.whl /
COPY torchvision-0.5.0-cp37-cp37m-linux_armv7l.whl /
ADD Data /Data
COPY requirements.txt /

RUN apt-get install libpng-dev libjpeg-dev zlib1g-dev libssl-dev libffi-dev \
     libxml2-dev libxslt1-dev libopenblas-dev

RUN pip install Pillow==4.1.1

RUN  python3 -m pip install torch-1.4.0-cp37-cp37m-linux_armv7l.whl
RUN python3 -m pip install torchvision-0.5.0-cp37-cp37m-linux_armv7l.whl

RUN cd /usr/local/lib/python3.7/dist-packages/torch && mv _C.cpython-37m-arm-linux-gnueabi.so _C.so && \
    mv _dl.cpython-37m-arm-linux-gnueabi.so _dl.so

RUN pip install --no-cache-dir -r requirements.txt

RUN chmod +x /app/LSTM.py
#CMD python /app/LSTM.py $CITY_ENV $SAMPLES_ENV $EPOCHS_ENV
CMD ["/bin/bash"]






FROM sphinxdoc/sphinx:3.5.1

LABEL "creator"="Ammar Askar <ammar@ammaraskar.com>"

LABEL "maintainer"="Damian Kula <heavelock@gmail.com>"

RUN apt-get update -yqq && \
    apt-get install -yqq build-essential gcc libproj-dev proj-data proj-bin libgeos-dev && \
    python -m pip install --no-cached-dir numpy && \
    python -m pip install shapely --no-cached-dir --no-binary shapely
    python -m pip install --no-cache-dir \
            "m2r2>=0.2.7" \
            "pybtex>=0.22.2" \
            sphinx_rtd_theme \
            matplotlib \
            cartopy

ADD entrypoint.py /entrypoint.py
ADD sphinx_action /sphinx_action

ENTRYPOINT ["/entrypoint.py"]

ARG NETBOX_VERSION=latest
FROM netboxcommunity/netbox:${NETBOX_VERSION}

COPY ./plugin_requirements.txt /opt/netbox/
RUN /usr/local/bin/uv pip install -r /opt/netbox/plugin_requirements.txt

# These lines are only required if your plugin has its own static files.
# Will probably be overridden by the deployment configs anyway...
# So for now we'll just comment them out to avoid confusion.

# COPY configuration/configuration.py /etc/netbox/config/configuration.py
# COPY configuration/plugins.py /etc/netbox/config/plugins.py
# RUN DEBUG="true" SECRET_KEY="dummydummydummydummydummydummydummydummydummydummy" \
#     /opt/netbox/venv/bin/python /opt/netbox/netbox/manage.py collectstatic --no-input

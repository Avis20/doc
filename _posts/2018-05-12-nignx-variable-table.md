---
title: "Nginx - Таблица переменных"
tags: [log_format, nginx]
reference:
  - title: dictionnary variable in log format NGINX
    link: https://stackoverflow.com/questions/37437153/dictionnary-variable-in-log-format-nginx
---

* TOC 
{:toc}

# Таблица переменных

<table>
    <tr>
        <th>Переменная</th>
        <th>Описание</th>
    </tr>
    <tr>
        <td>$ancient_browser</td>
        <td>equals the value set by the ancient_browser_value directive, if a browser was identified as ancient</td>
    </tr>
    <tr>
        <td>$arg_</td>
        <td>argument in the request line</td>
    </tr>
    <tr>
        <td>$args</td>
        <td>arguments in the request line</td>
    </tr>
    <tr>
        <td>$binary_remote_addr</td>
        <td>client address in a binary form, value’s length is always 4 bytes for IPv4 addresses or 16 bytes for IPv6 addresses</td>
    </tr>
    <tr>
        <td>$body_bytes_sent</td>
        <td>number of bytes sent to a client, not counting the response header; this variable is compatible with the “%B” parameter of the mod_log_config Apache module</td>
    </tr>
    <tr>
        <td>$bytes_sent</td>
        <td>number of bytes sent to a client (1.3.8, 1.2.5)</td>
    </tr>
    <tr>
        <td>$connection</td>
        <td>connection serial number (1.3.8, 1.2.5)</td>
    </tr>
    <tr>
        <td>$connection_requests</td>
        <td>current number of requests made through a connection (1.3.8, 1.2.5)</td>
    </tr>
    <tr>
        <td>$connections_active</td>
        <td>same as the Active connections value</td>
    </tr>
    <tr>
        <td>$connections_reading</td>
        <td>same as the Reading value</td>
    </tr>
    <tr>
        <td>$connections_waiting</td>
        <td>same as the Waiting value</td>
    </tr>
    <tr>
        <td>$connections_writing</td>
        <td>same as the Writing value</td>
    </tr>
    <tr>
        <td>$content_length</td>
        <td>“Content-Length” request header field</td>
    </tr>
    <tr>
        <td>$content_type</td>
        <td>“Content-Type” request header field</td>
    </tr>
    <tr>
        <td>$cookie_</td>
        <td>the named cookie</td>
    </tr>
    <tr>
        <td>$date_gmt</td>
        <td>current time in GMT. The format is set by the config command with the timefmt parameter</td>
    </tr>
    <tr>
        <td>$date_local</td>
        <td>current time in the local time zone. The format is set by the config command with the timefmt parameter</td>
    </tr>
    <tr>
        <td>$document_root</td>
        <td>root or alias directive’s value for the current request</td>
    </tr>
    <tr>
        <td>$document_uri</td>
        <td>same as $uri</td>
    </tr>
    <tr>
        <td>$fastcgi_path_info</td>
        <td>the value of the second capture set by the fastcgi_split_path_info directive. This variable can be used to set the PATH_INFO parameter</td>
    </tr>
    <tr>
        <td>$fastcgi_script_name</td>
        <td>request URI or, if a URI ends with a slash, request URI with an index file name configured by the fastcgi_index directive appended to it. This variable can be used to set the SCRIPT_FILENAME and PATH_TRANSLATED parameters that determine the script name in PHP. For example, for the “/info/” request with the following directives <br>fastcgi_index index.php;
                                fastcgi_param SCRIPT_FILENAME /home/www/scripts/php$fastcgi_script_name;
                            the SCRIPT_FILENAME parameter will be equal to “/home/www/scripts/php/info/index.php”</td>
    </tr>
    <tr>
        <td>$geoip_area_code</td>
        <td>telephone area code (US only)</td>
    </tr>
    <tr>
        <td>$geoip_city</td>
        <td>city name, for example, “Moscow”, “Washington”</td>
    </tr>
    <tr>
        <td>$geoip_city_continent_code</td>
        <td>two-letter continent code, for example, “EU”, “NA”</td>
    </tr>
    <tr>
        <td>$geoip_city_country_code</td>
        <td>two-letter country code, for example, “RU”, “US”</td>
    </tr>
    <tr>
        <td>$geoip_city_country_code3</td>
        <td>three-letter country code, for example, “RUS”, “USA”</td>
    </tr>
    <tr>
        <td>$geoip_city_country_name</td>
        <td>country name, for example, “Russian Federation”, “United States”</td>
    </tr>
    <tr>
        <td>$geoip_country_code</td>
        <td>two-letter country code, for example, “RU”, “US”</td>
    </tr>
    <tr>
        <td>$geoip_country_code3</td>
        <td>three-letter country code, for example, “RUS”, “USA”</td>
    </tr>
    <tr>
        <td>$geoip_country_name</td>
        <td>country name, for example, “Russian Federation”, “United States”</td>
    </tr>
    <tr>
        <td>$geoip_dma_code</td>
        <td>DMA region code in US (also known as “metro code”), according to the geotargeting in Google AdWords API</td>
    </tr>
    <tr>
        <td>$geoip_latitude</td>
        <td>latitude</td>
    </tr>
    <tr>
        <td>$geoip_longitude</td>
        <td>longitude</td>
    </tr>
    <tr>
        <td>$geoip_org</td>
        <td>organization name, for example, “The University of Melbourne”</td>
    </tr>
    <tr>
        <td>$geoip_postal_code</td>
        <td>postal code</td>
    </tr>
    <tr>
        <td>$geoip_region</td>
        <td>two-symbol country region code (region, territory, state, province, federal land and the like), for example, “48”, “DC”</td>
    </tr>
    <tr>
        <td>$geoip_region_name</td>
        <td>country region name (region, territory, state, province, federal land and the like), for example, “Moscow City”, “District of Columbia”</td>
    </tr>
    <tr>
        <td>$gzip_ratio</td>
        <td>achieved compression ratio, computed as the ratio between the original and compressed response sizes</td>
    </tr>
    <tr>
        <td>$host</td>
        <td>in this order of precedence: host name from the request line, or host name from the “Host” request header field, or the server name matching a request </td>
    </tr>
    <tr>
        <td>$hostname</td>
        <td>host name</td>
    </tr>
    <tr>
        <td>$http2</td>
        <td>negotiated protocol identifier: “h2” for HTTP/2 over TLS, “h2c” for HTTP/2 over cleartext TCP, or an empty string otherwise</td>
    </tr>
    <tr>
        <td>$http_</td>
        <td>arbitrary request header field; the last part of the variable name is the field name converted to lower case with dashes replaced by underscores. Examples: $http_referer, $http_user_agent</td>
    </tr>
    <tr>
        <td>$https</td>
        <td>“on” if connection operates in SSL mode, or an empty string otherwise</td>
    </tr>
    <tr>
        <td>$invalid_referer</td>
        <td>Empty string, if the “Referer” request header field value is considered valid, otherwise “1”</td>
    </tr>
    <tr>
        <td>$is_args</td>
        <td>“?” if a request line has arguments, or an empty string otherwise</td>
    </tr>
    <tr>
        <td>$limit_rate</td>
        <td>setting this variable enables response rate limiting; see limit_rate</td>
    </tr>
    <tr>
        <td>$memcached_key</td>
        <td>Defines a key for obtaining response from a memcached server</td>
    </tr>
    <tr>
        <td>$modern_browser</td>
        <td>equals the value set by the modern_browser_value directive, if a browser was identified as modern</td>
    </tr>
    <tr>
        <td>$msec</td>
        <td>current time in seconds with the milliseconds resolution (1.3.9, 1.2.6)</td>
    </tr>
    <tr>
        <td>$msie</td>
        <td>equals “1” if a browser was identified as MSIE of any version</td>
    </tr>
    <tr>
        <td>$nginx_version</td>
        <td>nginx version</td>
    </tr>
    <tr>
        <td>$pid</td>
        <td>PID of the worker process</td>
    </tr>
    <tr>
        <td>$pipe</td>
        <td>“p” if request was pipelined, “.” otherwise (1.3.12, 1.2.7)</td>
    </tr>
    <tr>
        <td>$proxy_add_x_forwarded_for</td>
        <td>the “X-Forwarded-For” client request header field with the $remote_addr variable appended to it, separated by a comma. If the “X-Forwarded-For” field is not present in the client request header, the $proxy_add_x_forwarded_for variable is equal to the $remote_addr variable</td>
    </tr>
    <tr>
        <td>$proxy_host</td>
        <td>name and port of a proxied server as specified in the proxy_pass directive</td>
    </tr>
    <tr>
        <td>$proxy_port</td>
        <td>port of a proxied server as specified in the proxy_pass directive, or the protocol’s default port</td>
    </tr>
    <tr>
        <td>$proxy_protocol_addr</td>
        <td>client address from the PROXY protocol header, or an empty string otherwise (1.5.12). the PROXY protocol must be previously enabled by setting the proxy_protocol parameter in the listen directive.</td>
    </tr>
    <tr>
        <td>$proxy_protocol_port</td>
        <td>client port from the PROXY protocol header, or an empty string otherwise (1.11.0). the PROXY protocol must be previously enabled by setting the proxy_protocol parameter in the listen directive.</td>
    </tr>
    <tr>
        <td>$query_string</td>
        <td>same as $args</td>
    </tr>
    <tr>
        <td>$realip_remote_addr</td>
        <td>keeps the original client address (1.9.7)</td>
    </tr>
    <tr>
        <td>$realip_remote_port</td>
        <td>keeps the original client port (1.11.0)</td>
    </tr>
    <tr>
        <td>$realpath_root</td>
        <td>an absolute pathname corresponding to the root or alias directive’s value for the current request, with all symbolic links resolved to real paths </td>
    </tr>
    <tr>
        <td>$remote_addr</td>
        <td>client address</td>
    </tr>
    <tr>
        <td>$remote_port</td>
        <td>client port</td>
    </tr>
    <tr>
        <td>$remote_user</td>
        <td>user name supplied with the Basic authentication</td>
    </tr>
    <tr>
        <td>$request</td>
        <td>full original request line</td>
    </tr>
    <tr>
        <td>$request_body</td>
        <td>request bod. The variable’s value is made available in locations processed by the proxy_pass, fastcgi_pass, uwsgi_pass, and scgi_pass directives.</td>
    </tr>
    <tr>
        <td>$request_body_file</td>
        <td>name of a temporary file with the request body. At the end of processing, the file needs to be removed. To always write the request body to a file, client_body_in_file_only needs to be enabled. When the name of a temporary file is passed in a proxied request or in a request to a FastCGI/uwsgi/SCGI server, passing the request body should be disabled by the proxy_pass_request_body off, fastcgi_pass_request_body off, uwsgi_pass_request_body off, or scgi_pass_request_body off directives, respectively.</td>
    </tr>
    <tr>
        <td>$request_completion</td>
        <td>“OK” if a request has completed, or an empty string otherwise</td>
    </tr>
    <tr>
        <td>$request_filename</td>
        <td>file path for the current request, based on the root or alias directives, and the request URI</td>
    </tr>
    <tr>
        <td>$request_id</td>
        <td>unique request identifier generated from 16 random bytes, in hexadecimal (1.11.0)</td>
    </tr>
    <tr>
        <td>$request_length</td>
        <td>request length (including request line, header, and request body) (1.3.12, 1.2.7)</td>
    </tr>
    <tr>
        <td>$request_method</td>
        <td>request method, usually “GET” or “POST”</td>
    </tr>
    <tr>
        <td>$request_time</td>
        <td>request processing time in seconds with a milliseconds resolution (1.3.9, 1.2.6); time elapsed since the first bytes were read from the client</td>
    </tr>
    <tr>
        <td>$request_uri</td>
        <td>full original request URI (with arguments)</td>
    </tr>
    <tr>
        <td>$scheme</td>
        <td>request scheme, “http” or “https”</td>
    </tr>
    <tr>
        <td>$secure_link</td>
        <td>The status of a link check. The specific value depends on the selected operation mode</td>
    </tr>
    <tr>
        <td>$secure_link_expires</td>
        <td>The lifetime of a link passed in a request; intended to be used only in the secure_link_md5 directive</td>
    </tr>
    <tr>
        <td>$sent_http_</td>
        <td>arbitrary response header field; the last part of the variable name is the field name converted to lower case with dashes replaced by underscores</td>
    </tr>
    <tr>
        <td>$server_addr</td>
        <td>an address of the server which accepted a request. Computing a value of this variable usually requires one system call. To avoid a system call, the listen directives must specify addresses and use the bind parameter.</td>
    </tr>
    <tr>
        <td>$server_name</td>
        <td>name of the server which accepted a request</td>
    </tr>
    <tr>
        <td>$server_port</td>
        <td>port of the server which accepted a request</td>
    </tr>
    <tr>
        <td>$server_protocol</td>
        <td>request protocol, usually “HTTP/1.0”, “HTTP/1.1”, or “HTTP/2.0”</td>
    </tr>
    <tr>
        <td>$session_log_binary_id</td>
        <td>current session ID in binary form (16 bytes)</td>
    </tr>
    <tr>
        <td>$session_log_id</td>
        <td>current session ID</td>
    </tr>
    <tr>
        <td>$slice_range</td>
        <td>the current slice range in HTTP byte range format, for example, bytes=0-1048575</td>
    </tr>
    <tr>
        <td>$spdy</td>
        <td>SPDY protocol version for SPDY connections, or an empty string otherwise</td>
    </tr>
    <tr>
        <td>$spdy_request_priority</td>
        <td>request priority for SPDY connections, or an empty string otherwise</td>
    </tr>
    <tr>
        <td>$ssl_cipher</td>
        <td>returns the string of ciphers used for an established SSL connection</td>
    </tr>
    <tr>
        <td>$ssl_client_cert</td>
        <td>returns the client certificate in the PEM format for an established SSL connection, with each line except the first prepended with the tab character; this is intended for the use in the proxy_set_header directive</td>
    </tr>
    <tr>
        <td>$ssl_client_fingerprint</td>
        <td>returns the SHA1 fingerprint of the client certificate for an established SSL connection (1.7.1)</td>
    </tr>
    <tr>
        <td>$ssl_client_i_dn</td>
        <td>returns the “issuer DN” string of the client certificate for an established SSL connection</td>
    </tr>
    <tr>
        <td>$ssl_client_raw_cert</td>
        <td>returns the client certificate in the PEM format for an established SSL connection</td>
    </tr>
    <tr>
        <td>$ssl_client_s_dn</td>
        <td>returns the “subject DN” string of the client certificate for an established SSL connection</td>
    </tr>
    <tr>
        <td>$ssl_client_serial</td>
        <td>returns the serial number of the client certificate for an established SSL connection</td>
    </tr>
    <tr>
        <td>$ssl_client_verify</td>
        <td>returns the result of client certificate verification: “SUCCESS”, “FAILED”, and “NONE” if a certificate was not present</td>
    </tr>
    <tr>
        <td>$ssl_protocol</td>
        <td>returns the protocol of an established SSL connection</td>
    </tr>
    <tr>
        <td>$ssl_server_name</td>
        <td>returns the server name requested through SNI (1.7.0)</td>
    </tr>
    <tr>
        <td>$ssl_session_id</td>
        <td>returns the session identifier of an established SSL connection</td>
    </tr>
    <tr>
        <td>$ssl_session_reused</td>
        <td>returns “r” if an SSL session was reused, or “.” otherwise (1.5.11)</td>
    </tr>
    <tr>
        <td>$status</td>
        <td>response status (1.3.2, 1.2.2)</td>
    </tr>
    <tr>
        <td>$tcpinfo_rtt</td>
        <td>, </td>
    </tr>
    <tr>
        <td>$tcpinfo_rttvar</td>
        <td>, </td>
    </tr>
    <tr>
        <td>$tcpinfo_snd_cwnd</td>
        <td>, </td>
    </tr>
    <tr>
        <td>$tcpinfo_rcv_space</td>
        <td>information about the client TCP connection; available on systems that support the TCP_INFO socket option</td>
    </tr>
    <tr>
        <td>$time_iso8601</td>
        <td>local time in the ISO 8601 standard format (1.3.12, 1.2.7)</td>
    </tr>
    <tr>
        <td>$time_local</td>
        <td>local time in the Common Log Format (1.3.12, 1.2.7)</td>
    </tr>
    <tr>
        <td>$uid_got</td>
        <td>The cookie name and received client identifier</td>
    </tr>
    <tr>
        <td>$uid_reset</td>
        <td>If the variable is set to a non-empty string that is not “0”, the client identifiers are reset. The special value “log” additionally leads to the output of messages about the reset identifiers to the error_log</td>
    </tr>
    <tr>
        <td>$uid_set</td>
        <td>The cookie name and sent client identifier</td>
    </tr>
    <tr>
        <td>$upstream_addr</td>
        <td>keeps the IP address and port, or the path to the UNIX-domain socket of the upstream server. If several servers were contacted during request processing, their addresses are separated by commas, e.g. “192.168.1.1:80, 192.168.1.2:80, unix:/tmp/sock”. If an internal redirect from one server group to another happens, initiated by “X-Accel-Redirect” or error_page, then the server addresses from different groups are separated by colons, e.g. “192.168.1.1:80, 192.168.1.2:80, unix:/tmp/sock : 192.168.10.1:80, 192.168.10.2:80”</td>
    </tr>
    <tr>
        <td>$upstream_cache_status</td>
        <td>keeps the status of accessing a response cache (0.8.3). The status can be either “MISS”, “BYPASS”, “EXPIRED”, “STALE”, “UPDATING”, “REVALIDATED”, or “HIT”</td>
    </tr>
    <tr>
        <td>$upstream_connect_time</td>
        <td>time spent on establishing a connection with an upstream server</td>
    </tr>
    <tr>
        <td>$upstream_cookie_</td>
        <td>cookie with the specified name sent by the upstream server in the “Set-Cookie” response header field (1.7.1). Only the cookies from the response of the last server are saved</td>
    </tr>
    <tr>
        <td>$upstream_header_time</td>
        <td>time between establishing a connection and receiving the first byte of the response header from the upstream server</td>
    </tr>
    <tr>
        <td>$upstream_http_</td>
        <td>keep server response header fields. For example, the “Server” response header field is available through the $upstream_http_server variable. The rules of converting header field names to variable names are the same as for the variables that start with the “$http_” prefix. Only the header fields from the response of the last server are saved</td>
    </tr>
    <tr>
        <td>$upstream_response_length</td>
        <td>keeps the length of the response obtained from the upstream server (0.7.27); the length is kept in bytes. Lengths of several responses are separated by commas and colons like addresses in the $upstream_addr variable</td>
    </tr>
    <tr>
        <td>$upstream_response_time</td>
        <td>time between establishing a connection and receiving the last byte of the response body from the upstream server</td>
    </tr>
    <tr>
        <td>$upstream_status</td>
        <td>keeps status code of the response obtained from the upstream server. Status codes of several responses are separated by commas and colons like addresses in the $upstream_addr variable</td>
    </tr>
    <tr>
        <td>$uri</td>
        <td>current URI in request, normalized. The value of $uri may change during request processing, e.g. when doing internal redirects, or when using index files.</td>
    </tr>
</table>

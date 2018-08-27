def app(env, start_response):
    start_response('200 OK', [('Content-Type', 'text/plain')])
    return "\n".join(env['QUERY_STRING'].split('&'))

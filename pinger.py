import requests
from requests.exceptions import HTTPError

PING_LIST = ['http://rpc.pingomatic.com/',
    'http://blogsearch.google.com/ping/RPC2']

GET_LIST = ['http://www.bing.com/webmaster/ping.aspx?siteMap=http%3A%2F%2Fochronus.com%2Fsitemap.txt',
    'http://www.google.com/webmasters/sitemaps/ping?sitemap=http%3A%2F%2Fochronus.com%2Fsitemap.txt']


def ping_all(name, url, change, feed, tags):
    errors = []
    print "Will ping", len(PING_LIST), "sites"
    for e in PING_LIST:
        try:
            ping_with_weblogsapi(e, name, url, change, feed, tags)
            print "Pinged", e
        except Exception as err:
            print "ERROR pinging", e, type(err), str(err)
    for url in GET_LIST:
        try:
             r = requests.get(url)
             r.raise_for_status()
             print "Got", url
        except Exception as err:
            print "ERROR GETing", url, type(err), str(err)
    return errors



def ping_with_weblogsapi(endpoint, name, url, change, feed, tags):
    """
    Pings a Weblogs api compatible service

    Parmaters:
     - endpoingt: the RPC endpoint
     - name: name of blog
     - url: blog homepage
     - changes: url of changed paged
     - feed: Atom or RSS feed url
     - tags: pipe '|' seperated list of tags
    """
    import xmlrpclib as xrl
    proxy = xrl.ServerProxy(endpoint)
    reply = proxy.weblogUpdates.extendedPing(name, url, change, feed, tags)
    #print endpoint, reply
    if reply['flerror']:
        raise Exception, reply['message']
    else:
        return reply['message']
ping_all('Ochronus', 'http://ochronus.com/', '', 'http://feeds.feedburner.com/ochronus_online', '')

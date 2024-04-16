import requests
from bs4 import BeautifulSoup

for end in ['world','india','kerala','editorial','sunday']:
    r = requests.get(f'https://www.manoramaonline.com/news/{end}.html')

    assert r.status_code == 200

    soup = BeautifulSoup(r.content, 'html.parser')

    f = open(f'{end}.html','wb')
    ts = soup.find_all('a',class_='cmp-story-list__title-link')
    h = ['https://www.manoramaonline.com'+t.get('href') for t in ts]
    l = [t.get('title') for t in ts]
    for t,h in zip(l,h):
        if t is not None:
            cont = ""
            # print("processing -",t)
            R = requests.get(h)
            # if requests.status_codes == 200:
                # print("got the thing")
            soup = BeautifulSoup(R.content, 'html.parser')
            div_container = soup.find_all('div', class_='rtearticle text')[0]
            # for div in div_container.find('div'):
            # print('p tags',div_container.find_all('p'))
            for ptag in div_container.find_all('p'):
                cont += ptag.text 
                print(ptag.text)

            f.write(b"<h1>"+t.encode()+b"</h1>\n")
            f.write(b"<p>"+cont.encode()+b"</p>\n\n")
            f.flush()
    f.close()

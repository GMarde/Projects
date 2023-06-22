import scrapy


class ImdbSpider(scrapy.Spider):
    name = 'imdb'
    start_urls = ['https://www.imdb.com/chart/top/']

    def parse(self, response):
        cont = 0
        for filmes in response.css('.titleColumn'):
            yield {
                'titulo': filmes.css('.titleColumn a::text').get(),
                'ano': filmes.css('.secondaryInfo::text').get()[1:-1],
                'nota': response.css('strong::text')[cont].get()

            }
            cont += 1


import csv
from imdb import IMDb
from collections import namedtuple

FILM_IDS_FILE = 'ml-latest-small/links.csv'
FILM_DATA_FILE = 'movies_data.csv'
ia = IMDb()

DbMovie = namedtuple('DbMovie', ['title', 'director', 'plot', 'rating'])


with open(FILM_IDS_FILE, 'r') as csvfile:
    # writer = csv.writer(csvwrite, delimiter=',')

    reader = csv.reader(csvfile, delimiter=',')
    next(reader)
    for row in reader:
        movie_id, imdb_id, _ = row
        print(movie_id, imdb_id)
        movie_data = ia.get_movie(str(imdb_id))
        title, director = movie_data['title'], movie_data['director'][0]
        plot, rating = movie_data['plot outline'], movie_data['rating']
        plot = plot.replace("'", "''")
        print("'{}', '{}', '{}', {}".format(title, director, plot, rating))




# get a movie and print its director(s)
# the_matrix = ia.get_movie('0133093')
# print(the_matrix['director'])

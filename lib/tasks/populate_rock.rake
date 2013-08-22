desc "populate API rock list"
task :populate_rock => :environment do
  require 'open-uri'
  require 'json'

  result = JSON.parse(open("http://personaldjhome.herokuapp.com/lists/rock.json").read)

  a = result[0]
  @title_1 = a["title"]
  @artist_1 = a["artist"]
  @id_1 = a["id"]

  b = result[1]
  @title_2 = b["title"]
  @artist_2 = b["artist"]
  @id_2 = b["id"]

  c = result[2]
  @title_3 = c["title"]
  @artist_3 = c["artist"]
  @id_3 = c["id"]

  d = result[3]
  @title_4 = d["title"]
  @artist_4 = d["artist"]
  @id_4 = d["id"]

  e = result[4]
  @title_5 = e["title"]
  @artist_5 = e["artist"]
  @id_5 = e["id"]

  f = result[5]
  @title_6 = f["title"]
  @artist_6 = f["artist"]
  @id_6 = f["id"]

  g = result[6]
  @title_7 = g["title"]
  @artist_7 = g["artist"]
  @id_7 = g["id"]

  h = result[7]
  @title_8 = h["title"]
  @artist_8 = h["artist"]
  @id_8 = h["id"]

  i = result[8]
  @title_9 = i["title"]
  @artist_9 = i["artist"]
  @id_9 = i["id"]

  j = result[9]
  @title_10 = j["title"]
  @artist_10 = j["artist"]
  @id_10 = j["id"]

  k = result[10]
  @title_11 = k["title"]
  @artist_11 = k["artist"]
  @id_11 = k["id"]

  l = result[11]
  @title_12 = l["title"]
  @artist_12 = l["artist"]
  @id_12 = l["id"]

  m = result[12]
  @title_13 = m["title"]
  @artist_13 = m["artist"]
  @id_13 = m["id"]

  n = result[13]
  @title_14 = n["title"]
  @artist_14 = n["artist"]
  @id_14 = n["id"]

  o = result[14]
  @title_15 = o["title"]
  @artist_15 = o["artist"]
  @id_15 = o["id"]

  p = result[15]
  @title_16 = p["title"]
  @artist_16 = p["artist"]
  @id_16 = p["id"]

  q = result[16]
  @title_17 = q["title"]
  @artist_17 = q["artist"]
  @id_17 = q["id"]

  r = result[17]
  @title_18 = r["title"]
  @artist_18 = r["artist"]
  @id_18 = r["id"]

  s = result[18]
  @title_19 = s["title"]
  @artist_19 = s["artist"]
  @id_19 = s["id"]

  t = result[19]
  @title_20 = t["title"]
  @artist_20 = t["artist"]
  @id_20 = t["id"]

  #genre is predefined
  @genre = 2

  List.create(title: @title_20, artist: @artist_20, list_id: @id_20, genre: @genre)
  List.create(title: @title_19, artist: @artist_19, list_id: @id_19, genre: @genre)
  List.create(title: @title_18, artist: @artist_18, list_id: @id_18, genre: @genre)
  List.create(title: @title_17, artist: @artist_17, list_id: @id_17, genre: @genre)
  List.create(title: @title_16, artist: @artist_16, list_id: @id_16, genre: @genre)
  List.create(title: @title_15, artist: @artist_15, list_id: @id_15, genre: @genre)
  List.create(title: @title_14, artist: @artist_14, list_id: @id_14, genre: @genre)
  List.create(title: @title_13, artist: @artist_13, list_id: @id_13, genre: @genre)
  List.create(title: @title_12, artist: @artist_12, list_id: @id_12, genre: @genre)
  List.create(title: @title_11, artist: @artist_11, list_id: @id_11, genre: @genre)
  List.create(title: @title_10, artist: @artist_10, list_id: @id_10, genre: @genre)
  List.create(title: @title_9, artist: @artist_9, list_id: @id_9, genre: @genre)
  List.create(title: @title_8, artist: @artist_8, list_id: @id_8, genre: @genre)
  List.create(title: @title_7, artist: @artist_7, list_id: @id_7, genre: @genre)
  List.create(title: @title_6, artist: @artist_6, list_id: @id_6, genre: @genre)
  List.create(title: @title_5, artist: @artist_5, list_id: @id_5, genre: @genre)
  List.create(title: @title_4, artist: @artist_4, list_id: @id_4, genre: @genre)
  List.create(title: @title_3, artist: @artist_3, list_id: @id_3, genre: @genre)
  List.create(title: @title_2, artist: @artist_2, list_id: @id_2, genre: @genre)
  List.create(title: @title_1, artist: @artist_1, list_id: @id_1, genre: @genre)

  #remove duplicates
  List.dedupe

end

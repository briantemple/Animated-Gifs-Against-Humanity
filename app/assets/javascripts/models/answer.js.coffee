# for more details see: http://emberjs.com/guides/models/defining-models/

Agah.Answer = DS.Model.extend
  text: DS.attr 'string'
  url: DS.attr 'string'
  pictureId: DS.attr 'string'

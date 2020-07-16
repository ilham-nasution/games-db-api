# Games DB API

```GET https://games-db-api.herokuapp.com/api/v1/developers```
<br />
example response :
```
[
  {
    "id": 1,
    "name": "Square Enix",
    "image": "http://res.cloudinary.com/nst-img/image/upload/cwgiccphlih4zqr2qrsmgt87k21c"
  },
  {
    "id": 2,
    "name": "CD Projekt Red",
    "image": "http://res.cloudinary.com/nst-img/image/upload/gxrwf0ss0fbsc65uvpwtsx025cyi"
  },
  {
    "id": 3,
    "name": "Capcom",
    "image": "http://res.cloudinary.com/nst-img/image/upload/r9hqf4chhmcq7963ob4edkktjsbt"
  },
]
```
<br />

```SHOW https://games-db-api.herokuapp.com/api/v1/developers/{id}```
<br/>
params :

| Name | Type | Example | Description |
| ------ | ----- | ----- | ----- |
| id | Integer | 1 | The id of game |

<br />
example response :
```
{
  "id": 1,
  "name": "Square Enix",
  "image": "http://res.cloudinary.com/nst-img/image/upload/cwgiccphlih4zqr2qrsmgt87k21c",
  "games": [
    {
      "id": 2,
      "title": "Final Fantasy VII Remake",
      "rating": 10
    }
  ]
}
```

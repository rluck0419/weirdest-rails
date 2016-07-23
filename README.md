# README

```
https://limitless-falls-88798.herokuapp.com/
https://limitless-falls-88798.herokuapp.com/places
```
The home & '/places' URLs provides json of all the places (GET)
Places can be created via this URL as well (POST)

```
https://limitless-falls-88798.herokuapp.com/places/1
```
Individual places can be reached via '/places/#' (GET)
Each place can also be edited (PUT) and deleted (DELETE) from this URL


```
https://limitless-falls-88798.herokuapp.com/users
```
All users can be reached via '/users' (GET)
Users can be created via this URL as well (POST)


```
https://limitless-falls-88798.herokuapp.com/users/1
```
Each user can be reached via '/users/#' (GET)
Users can also be edited (PUT) and deleted (DELETE) from this URL

```
https://limitless-falls-88798.herokuapp.com/login
```
login can be reached here (POST) - it will either give you the authentication token, or notify you if invalid email/password

```
https://limitless-falls-88798.herokuapp.com/votes
```
votes can be created by this url (POST) - A user can only cast one vote per place (votes will have a user_id and a place_id)

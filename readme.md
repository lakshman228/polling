# Installation instructions

### Docker environment

1. Make sure docker engine and docker-compose are properly installed on your dev machine
2. Clone the repository
3. CD into the project code
4. copy `env.example` into `.env`
5. Generate a secrete key and assign the value to `SECRET_KEY` variable
6. Assign values to your database variables accordingly
7. Run `docker compose build`
8. Run `docker compose up`
9. Run `docker compose exec polling python3 manage.py migrate`
10. Run `docker compose exec polling python3 manage.py createsuperuser`.
11. put any other instructions for your specific application


### Other environments installation intructions
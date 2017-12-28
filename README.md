# Flask Restful API - Operator

### Install Python MySQL

`sudo easy_install mysql-python `

`sudo pip install mysqlclient `

### Install Required

```
sudo pip install -r requirements.txt
```
### Run server

`python3 server.py`

### Services

```
http://localhost:3000/operator
```

`List Products - GET`

`Register Products - POST`

```
http://localhost:3000/product?category=<string:category>
```

`List Products by category  - GET`

```
http://localhost:3000/product/list_filterby/<int:id>
```

`Get Product by Id - GET`

`Update Product by Id - PUT`

`Delete Product by Id - DELETE`

```
http://localhost:3000/product/list_product/<string:name>
```

`Get Product by Name - GET`

`Update Product by Name - PUT`

`Delete Product by Name - DELETE`

### Run Test

`python3 test/test_product_api.py`

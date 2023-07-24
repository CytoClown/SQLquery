## POST Products. Запрос api/v1/products. Добавление данных в БД.
## Запросить токен с помощью запроса
## POST https://www.advantageonlineshopping.com/accountservice/accountrest/api/v1/login
## Выполнить запрос POST api/v1/products
## OP 
 {
  "attributes": [
    {
      "attributeName": "string",
      "attributeValue": "string"
    }
  ],
  "categoryId": 1,
  "colors": [
    {
      "code": "4300",
      "inStock": 10,
      "name": "Ковер самолет"
    }
  ],
  "description": "string",
  "imageUrl": "1300",
  "images": [
    "string"
  ],
  "price": 335.0,
  "productId": 36,
  "productName": "String",
  "productStatus": "Active"
}

 ## Проверка названия нового товара в БД
SELECT
product_name
FROM
product
WHERE
product_id = {id из JSON ответа}

## Сделать запрос в БД для получения productstatus нового продукта
SELECT
productstatus
FROM
product
WHERE
product_id = {id из JSON ответа}

## Сделать запрос в БД для проверки соответствия цены продукта
SELECT
price
FROM
product
WHERE
product_id = {product_id}

## Выполнить запрос в БД на соответствие продукта его категории
SELECT
product_id
FROM
product
WHERE
category_id = {categoryId} AND product_id = {productId}

## Сделать запрос в БД для проверки соответствия описания продукта
SELECT
description
FROM
product
WHERE
product_id = {product_id}

## Сделать запрос в БД для проверки изображения продукта
SELECT
managed_image_id
FROM
product
WHERE
product_id = {product_id}

## Сделать запрос в БД для проверки изображения продукта
SELECT
managed_image_id
FROM
product
WHERE
product_id = {product_id}

## Сделать запрос в БД для получения количества изображений продукта
SELECT
COUNT(imageurl)
FROM
imageattribute
WHERE
product_id = {productId}

## Сделать запрос в БД для определения соответствия изображения продукта его id
SELECT
imageurl
FROM
imageattribute
WHERE
product_id = {productId} AND imageurl = {images}

## Сделать запрос в БД для выяснения количества цветов продукта
SELECT
COUNT(code) AS Colors
FROM
colorattribute
WHERE
product_id = {productId}

## Сделать запрос в БД для проверки соответствия названия цвета продукту
SELECT
name
FROM
colorattribute
WHERE
product_id = {productId}  AND code = 'code'

## Выполнить запрос из БД для проверки количества товара определенного цвета
SELECT
instock
FROM
colorattribute
WHERE
product_id = {productId} AND code = 'code'

## Сделать запрос в БД для выяснения количества атрибутов продукта
SELECT
COUNT(attribute_id) AS numberofAttr
FROM
product_attributes
WHERE product_id = {productId}

## Сделать запрос в БД для проверки соответствия названия атрибута продукту
SELECT
attribute.name AS attr_name
FROM
product_attributes
INNER JOIN
attribute ON product_attributes.attribute_id = attribute.attribute_id
WHERE product_id = {productId} AND name = {'attributeName'}
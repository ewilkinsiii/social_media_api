# Social Media API

## Setup:

- Database: CockroachDB // great for scaling and has a Postgres compatibility layer
  Can switch to Postgres just comment out the CockroachDB gem and uncomment the Postgres gem in the Gemfile

```ruby
    #gem 'activerecord-cockroachdb-adapter', '~> 7.0', '>= 7.0.3'
    gem 'pg', '~> 1.5', '>= 1.5.4'
```

# API Documentation for Your Rails API

## Introduction

This API documentation provides details on the endpoints and operations available in our RESTful Rails API.

## Base URL

All endpoints are relative to the base URL: `https://your-api.com/api/v1`

## Authentication

### 1. User

#### Create user

- **URL:** `/auth/`
- **Method:** `POST
- **Description:** Create new user from email.
- **Request:**
  - Headers: [List of required headers]
  - Params
    ```json
    [
      {
        "email": "test@test.com",
        "password": "123password",
        "password_confirmation": "123password",
        "name": "john Doe",
        "username": "jdoe"
      }
    ]
    ```
- **Response:**
  - Status Code: `200 OK`
  - Example Response:

    ```json
    {
      "status": "success",
      "data": {
        "email": "test@test.com",
        "provider": "email",
        "uid": "test@test.com",
        "id": 910679207744503809,
        "allow_password_change": false,
        "name": "John Doe",
        "username": "jdoe",
        "avatar": null,
        "created_at": "2023-10-22T15:13:58.647Z",
        "updated_at": "2023-10-22T15:13:59.317Z",
        "github_uid": null,
        "github_token": null,
        "github_username": null,
        "type": "user"
      }
    }
    ```

    #Auth Token

    In the header you will find the details that you will need in order to get data from the following request.

    ```
        access-token
        client
        expiry
        uid
        Authorization
    ```

##### Header for request

```
        access-token:vyf5lqG6isI_TF6Xegrstw
        token-type:Bearer
        client:pEboaxP2dj3fD92rxpL39A
        expiry:1698890844
        uid:test@test.com
        Authorization: Bearer eyJhY2Nlc3MtdG9rZW4iOiJ2eWY1bHewtewtewzSV9URjZYZWdyc3R3IiwidG9rZW4tdHlwZSI6IkJlYXwetewtewtsImNsaWVudCI6InBFYm9heFAyZGozZkQ5MnJ4cEwzOUEiLCJleHBpcnkiOiIxNjk4ODkwODQ0Iiwideweewtiam9obmRvZTNAdGVzdC5jb20ifQ==
```

#### Create user provider GitHub

- **URL:** `/auth/`
- **Method:** `POST
- **Description:** Create new user from GitHub.
- **Request:**

  - Headers: [List of required headers]
  - params

    ```json
         "github_token:": 'ghpepeif-godsgsjdgbsk'
         "github_uid": 12344576486'
         "github_username": 'jdoe'
         "provider": "github"
    ```

- **Response:**
  - Status Code: `200 OK`
  - Example Response:
    ```json
    [
      {
        "github_token:": 'ghpepeif-godsgsjdgbsk',
        "github_uid": 12344576486',
        "github_username": 'jdoe',
        "provider": "github"
      },
    ]
    ```

### User sign in

- **URL:** `/auth/sign_in`
- **Method:** `POST
- **Description:** Create new user from GitHub.
- **Request:**
  - Headers: [List of required headers]
  - body
  ```
         "username:": 'test@test.com'
         "password": 123password'
  ```
- **Response:**
  - Status Code: `200 OK`
  - Example Response:
    ```json
    {
      "data": {
        "email": "test@test.com",
        "provider": "email",
        "uid": "test@test.com",
        "id": 910679207744503809,
        "allow_password_change": false,
        "name": "John Doe",
        "username": "jdoe",
        "avatar": null,
        "github_uid": null,
        "github_token": null,
        "github_username": null,
        "type": "user"
      }
    }
    ```

Before making requests to the API, you need to authenticate using [authentication method].

## Endpoints

### 1. User Ratings

#### Get User Ratings

- **URL:** `/user_rating`
- **Method:** `GET`
- **Description:** Get a list of user ratings.
- **Request:**
  - Headers: [List of required headers](#header-for-request)
- **Response:**
  - Status Code: `200 OK`
  - Example Response:

```json
{
  "data": {
    "id": "910699508293238785",
    "type": "user-ratings",
    "attributes": {
      "rating": 5,
      "user-id": 910153398351495169,
      "rater-id": 910153685371650049,
      "created-at": "2023-10-22T16:57:13.758Z",
      "updated-at": "2023-10-22T17:02:00.876Z"
    },
    "relationships": {
      "user": {
        "data": {
          "id": "910153398351495169",
          "type": "users"
        }
      }
    },
    "links": {
      "self": "/api/v1/user_ratings/910699508293238785"
    }
  },
  "included": [
    {
      "id": "910153398351495169",
      "type": "users",
      "attributes": {
        "username": "jdoe",
        "email": "johndoe8@test.com",
        "name": "John Doe",
        "avatar": null,
        "average-rating": 5
      },
      "relationships": {
        "posts": {
          "data": [
            {
              "id": "910184678278135809",
              "type": "posts"
            },
            {
              "id": "910184678775455745",
              "type": "posts"
            },
            {
              "id": "910184679273857025",
              "type": "posts"
            },
            {
              "id": "910184679758856193",
              "type": "posts"
            },
            {
              "id": "910417963252252673",
              "type": "posts"
            },
            {
              "id": "910692902668238849",
              "type": "posts"
            }
          ]
        },
        "user-ratings": {
          "data": [
            {
              "id": "910699508293238785",
              "type": "user-ratings"
            }
          ]
        }
      }
    }
  ]
}
```

#### Create User Rating

- **URL:** `/user_rating`
- **Method:** `POST`
- **Description:** Create a new user rating.
- **Request:**
  - Headers: [List of required headers](#header-for-request)
- Body:
  ```json
  {
      "user_rating":{
          "user_id": 123353,
          "rater_id": 14431
          "rating": 4
      }
  }
  ```
- **Validations:**
  - user_id integer
  - rater_id integer
  - rating: range 1-5
- **Response:**

  - Status Code: `201 Created`
  - Example Response:
    ```json
    {
      "data": {
        "id": "910699508293238785",
        "type": "user-ratings",
        "attributes": {
          "rating": 4,
          "user-id": 910153398351495169,
          "rater-id": 910153685371650049,
          "created-at": "2023-10-22T16:57:13.758Z",
          "updated-at": "2023-10-22T16:57:13.758Z"
        },
        "relationships": {
          "user": {
            "data": {
              "id": "910153398351495169",
              "type": "users"
            }
          }
        },
        "links": {
          "self": "/api/v1/user_ratings/910699508293238785"
        }
      }
    }
    ```

  ```

  ```

#### Update User Rating

- **URL:** `/api/v1/user_rating/:user_rating_id`
- **Method:** `PUT`
- **Description:** Update an existing user rating.
- **Request:**
- Headers: [List of required headers](#header-for-request)
- Body:

```json
{
  "user_rating": {
    "rating": 3
  }
}
```

- **Response:**

- Status Code: `200 OK`

- Example Response:

```json
{
  "data": {
    "id": "910699508293238785",
    "type": "user-ratings",
    "attributes": {
      "rating": 5,
      "user-id": 910153398351495169,
      "rater-id": 910153685371650049,
      "created-at": "2023-10-22T16:57:13.758Z",
      "updated-at": "2023-10-22T17:02:00.876Z"
    },
    "relationships": {
      "user": {
        "data": {
          "id": "910153398351495169",
          "type": "users"
        }
      }
    },
    "links": {
      "self": "/api/v1/user_ratings/910699508293238785"
    }
  }
}
```

#### Delete User Rating

- **URL:** `api/v1/user_rating/:user_rating_id`
- **Method:** `DELETE`
- **Description:** Delete a user rating.
- **Request:**
- Headers: [List of required headers](#header-for-request)
- **Response:**

- Status Code: `204 No Content`

### 2. Posts

#### Get Posts

- **URL:** `api/v1/posts`
- **Method:** `GET`
- **Description:** Get a list of posts.
- **Request:**
- Headers: [List of required headers](#header-for-request)
- Pageination Params:
  page
  per_page
- **Response:**

- Status Code: `200 OK`
- Example Response:

```json
{
  "data": [
    {
      "id": "909634374457655297",
      "type": "posts",
      "attributes": {
        "title": "Ipsam veniam eligendi id.",
        "body": "Sunt vel quia. Omnis temporibus voluptatibus. Dicta voluptates labore.",
        "created-at": "2023-10-18T22:39:40.703Z",
        "updated-at": "2023-10-18T22:39:40.703Z"
      },
      "relationships": {
        "user": {
          "data": {
            "id": "909628900115906561",
            "type": "users"
          }
        },
        "comments": {
          "data": [
            {
              "id": "909711445749497857",
              "type": "comments"
            },
            {
              "id": "909711446247931905",
              "type": "comments"
            },
            {
              "id": "909711446746529793",
              "type": "comments"
            },
            {
              "id": "909711447270555649",
              "type": "comments"
            },
            {
              "id": "909711447768530945",
              "type": "comments"
            }
          ]
        }
      },
      "links": {
        "self": "/api/v1/posts/909634374457655297"
      }
    },
    {
      "id": "909634374958252033",
      "type": "posts",
      "attributes": {
        "title": "Ratione ad nobis quae.",
        "body": "Perspiciatis et et. Accusantium vel voluptatum. Consequuntur est repudiandae.",
        "created-at": "2023-10-18T22:39:40.858Z",
        "updated-at": "2023-10-18T22:39:40.858Z"
      },
      "relationships": {
        "user": {
          "data": {
            "id": "909628900115906561",
            "type": "users"
          }
        },
        "comments": {
          "data": [
            {
              "id": "909711448909643777",
              "type": "comments"
            },
            {
              "id": "909711449407881217",
              "type": "comments"
            },
            {
              "id": "909711449983746049",
              "type": "comments"
            }
          ]
        }
      },
      "links": {
        "self": "/api/v1/posts/909634374958252033"
      }
    },
    {
      "id": "909634375456030721",
      "type": "posts",
      "attributes": {
        "title": "Eaque labore autem commodi.",
        "body": "Sint nam et. Maiores est qui. Voluptatem qui eius.",
        "created-at": "2023-10-18T22:39:41.011Z",
        "updated-at": "2023-10-18T22:39:41.011Z"
      },
      "relationships": {
        "user": {
          "data": {
            "id": "909628900115906561",
            "type": "users"
          }
        },
        "comments": {
          "data": [
            {
              "id": "909711451084554241",
              "type": "comments"
            },
            {
              "id": "909711451608776705",
              "type": "comments"
            },
            {
              "id": "909711452094332929",
              "type": "comments"
            }
          ]
        }
      },
      "links": {
        "self": "/api/v1/posts/909634375456030721"
      }
    },
    {
      "id": "909634375952203777",
      "type": "posts",
      "attributes": {
        "title": "Veniam voluptas excepturi quaerat.",
        "body": "Fuga sequi repudiandae. Quidem voluptates et. Quo sint laboriosam.",
        "created-at": "2023-10-18T22:39:41.161Z",
        "updated-at": "2023-10-18T22:39:41.161Z"
      },
      "relationships": {
        "user": {
          "data": {
            "id": "909628900115906561",
            "type": "users"
          }
        },
        "comments": {
          "data": [
            {
              "id": "909711453024845825",
              "type": "comments"
            },
            {
              "id": "909711453522853889",
              "type": "comments"
            },
            {
              "id": "909711454007590913",
              "type": "comments"
            }
          ]
        }
      },
      "links": {
        "self": "/api/v1/posts/909634375952203777"
      }
    },
    {
      "id": "909634376451686401",
      "type": "posts",
      "attributes": {
        "title": "Nihil inventore ipsum reprehenderit.",
        "body": "Tenetur sunt ut. Aut et quis. Quia alias saepe.",
        "created-at": "2023-10-18T22:39:41.311Z",
        "updated-at": "2023-10-18T22:39:41.311Z"
      },
      "relationships": {
        "user": {
          "data": {
            "id": "909628900115906561",
            "type": "users"
          }
        },
        "comments": {
          "data": [
            {
              "id": "909711455947259905",
              "type": "comments"
            },
            {
              "id": "909711456445726721",
              "type": "comments"
            },
            {
              "id": "909711456956874753",
              "type": "comments"
            },
            {
              "id": "909711457454948353",
              "type": "comments"
            },
            {
              "id": "909711457952530433",
              "type": "comments"
            }
          ]
        }
      },
      "links": {
        "self": "/api/v1/posts/909634376451686401"
      }
    },
    {
      "id": "909634376921153537",
      "type": "posts",
      "attributes": {
        "title": "Quia voluptas occaecati est.",
        "body": "Sapiente temporibus ut. Occaecati ut ea. Aliquam laboriosam ratione.",
        "created-at": "2023-10-18T22:39:41.456Z",
        "updated-at": "2023-10-18T22:39:41.456Z"
      },
      "relationships": {
        "user": {
          "data": {
            "id": "909628901806768129",
            "type": "users"
          }
        },
        "comments": {
          "data": [
            {
              "id": "909711459342614529",
              "type": "comments"
            },
            {
              "id": "909711459959013377",
              "type": "comments"
            }
          ]
        }
      },
      "links": {
        "self": "/api/v1/posts/909634376921153537"
      }
    },
    {
      "id": "909634377407102977",
      "type": "posts",
      "attributes": {
        "title": "Alias tempore expedita accusantium.",
        "body": "Quo nihil magni. Optio sequi et. Dolores rem error.",
        "created-at": "2023-10-18T22:39:41.606Z",
        "updated-at": "2023-10-18T22:39:41.606Z"
      },
      "relationships": {
        "user": {
          "data": {
            "id": "909628901806768129",
            "type": "users"
          }
        },
        "comments": {
          "data": [
            {
              "id": "909711461361385473",
              "type": "comments"
            },
            {
              "id": "909711461846122497",
              "type": "comments"
            },
            {
              "id": "909711462343671809",
              "type": "comments"
            },
            {
              "id": "909711462841810945",
              "type": "comments"
            },
            {
              "id": "909711463353516033",
              "type": "comments"
            }
          ]
        }
      },
      "links": {
        "self": "/api/v1/posts/909634377407102977"
      }
    },
    {
      "id": "909634377880403969",
      "type": "posts",
      "attributes": {
        "title": "Neque doloremque odit est.",
        "body": "Est quas quis. Aliquid numquam a. Eveniet ex odit.",
        "created-at": "2023-10-18T22:39:41.747Z",
        "updated-at": "2023-10-18T22:39:41.747Z"
      },
      "relationships": {
        "user": {
          "data": {
            "id": "909628903498055681",
            "type": "users"
          }
        },
        "comments": {
          "data": [
            {
              "id": "909711464689631233",
              "type": "comments"
            },
            {
              "id": "909711465189113857",
              "type": "comments"
            },
            {
              "id": "909711465687056385",
              "type": "comments"
            },
            {
              "id": "909711466408280065",
              "type": "comments"
            }
          ]
        }
      },
      "links": {
        "self": "/api/v1/posts/909634377880403969"
      }
    },
    {
      "id": "909634378376544257",
      "type": "posts",
      "attributes": {
        "title": "Cupiditate facilis non tenetur.",
        "body": "Ipsum iusto officia. Dolores quod sint. Ab magnam eveniet.",
        "created-at": "2023-10-18T22:39:41.898Z",
        "updated-at": "2023-10-18T22:39:41.898Z"
      },
      "relationships": {
        "user": {
          "data": {
            "id": "909628903498055681",
            "type": "users"
          }
        },
        "comments": {
          "data": [
            {
              "id": "909711468872073217",
              "type": "comments"
            },
            {
              "id": "909711469514194945",
              "type": "comments"
            }
          ]
        }
      },
      "links": {
        "self": "/api/v1/posts/909634378376544257"
      }
    },
    {
      "id": "909634378888511489",
      "type": "posts",
      "attributes": {
        "title": "Omnis et numquam fugiat.",
        "body": "Libero alias aut. Eveniet aliquid iusto. Illo sapiente dicta.",
        "created-at": "2023-10-18T22:39:42.051Z",
        "updated-at": "2023-10-18T22:39:42.051Z"
      },
      "relationships": {
        "user": {
          "data": {
            "id": "909628905122988033",
            "type": "users"
          }
        },
        "comments": {
          "data": [
            {
              "id": "909711470981578753",
              "type": "comments"
            },
            {
              "id": "909711471623241729",
              "type": "comments"
            },
            {
              "id": "909711472280993793",
              "type": "comments"
            },
            {
              "id": "909711473019781121",
              "type": "comments"
            }
          ]
        }
      },
      "links": {
        "self": "/api/v1/posts/909634378888511489"
      }
    }
  ],
  "included": [
    {
      "id": "909628900115906561",
      "type": "users",
      "attributes": {
        "username": "Marie Upton I",
        "email": "shirlene.johns@legros.test",
        "first-name": "Seymour",
        "last-name": "Klocko",
        "avatar": null
      },
      "relationships": {
        "posts": {
          "data": [
            {
              "id": "909634374457655297",
              "type": "posts"
            },
            {
              "id": "909634374958252033",
              "type": "posts"
            },
            {
              "id": "909634375456030721",
              "type": "posts"
            },
            {
              "id": "909634375952203777",
              "type": "posts"
            },
            {
              "id": "909634376451686401",
              "type": "posts"
            }
          ]
        }
      }
    },
    {
      "id": "909628901806768129",
      "type": "users",
      "attributes": {
        "username": "Rev. Grant Toy",
        "email": "eddie@kertzmann-wyman.test",
        "first-name": "Hassie",
        "last-name": "Renner",
        "avatar": null
      },
      "relationships": {
        "posts": {
          "data": [
            {
              "id": "909634376921153537",
              "type": "posts"
            },
            {
              "id": "909634377407102977",
              "type": "posts"
            }
          ]
        }
      }
    },
    {
      "id": "909628903498055681",
      "type": "users",
      "attributes": {
        "username": "Coleman Adams",
        "email": "lionel.sauer@prosacco.test",
        "first-name": "Susana",
        "last-name": "Keeling",
        "avatar": null
      },
      "relationships": {
        "posts": {
          "data": [
            {
              "id": "909634377880403969",
              "type": "posts"
            },
            {
              "id": "909634378376544257",
              "type": "posts"
            }
          ]
        }
      }
    },
    {
      "id": "909628905122988033",
      "type": "users",
      "attributes": {
        "username": "Gary Sauer DO",
        "email": "santos_harvey@ratke.example",
        "first-name": "Sharri",
        "last-name": "Bernier",
        "avatar": null
      },
      "relationships": {
        "posts": {
          "data": [
            {
              "id": "909634378888511489",
              "type": "posts"
            },
            {
              "id": "909634379385896961",
              "type": "posts"
            },
            {
              "id": "909634379883773953",
              "type": "posts"
            },
            {
              "id": "909634380381847553",
              "type": "posts"
            }
          ]
        }
      }
    }
  ],
  "links": {
    "self": "http://localhost:3001/api/v1/posts?page%5Bnumber%5D=2&page%5Bsize%5D=10&per_page=10",
    "first": "http://localhost:3001/api/v1/posts?page%5Bnumber%5D=1&page%5Bsize%5D=10&per_page=10",
    "prev": "http://localhost:3001/api/v1/posts?page%5Bnumber%5D=1&page%5Bsize%5D=10&per_page=10",
    "next": "http://localhost:3001/api/v1/posts?page%5Bnumber%5D=3&page%5Bsize%5D=10&per_page=10",
    "last": "http://localhost:3001/api/v1/posts?page%5Bnumber%5D=29&page%5Bsize%5D=10&per_page=10"
  },
  "meta": {
    "current-page": 2,
    "total-pages": 29,
    "total-count": 284
  }
}
```

#### Create Post

- **URL:** `api/v1/posts`
- **Method:** `POST`
- **Description:** Create a new post.
- **Request:**
  - Headers: [List of required headers](#header-for-request)
  - Body:
  ```json
  {
    "post": {
      "body": "Hello World this is my comment",
      "title": "Third  post the job works",
      "user_id": 810153398351495169
    }
  }
  ```
- **Response:**

- Status Code: `201 Created`

- Example Response:

```json
{
  "data": {
    "id": "910692902668238849",
    "type": "posts",
    "attributes": {
      "title": "Third  post the job works",
      "body": "Hello World this is my comment",
      "created-at": "2023-10-22T16:23:37.996Z",
      "updated-at": "2023-10-22T16:23:37.996Z",
      "average-rating": 0
    },
    "relationships": {
      "user": {
        "data": {
          "id": "810153398351495169",
          "type": "users"
        }
      },
      "comments": {
        "data": []
      }
    },
    "links": {
      "self": "/api/v1/posts/910692902668238849"
    }
  }
}
```

#### Update Post

- **URL:** `/posts/:post_id`

- **Method:** `PUT`

- **Description:** Update an existing post.

- **Request:**

  - Headers: [List of required headers](#header-for-request)

  - Body:

  ```json
  {
    "post": {
      "title": "Updated Post Title"
    }
  }
  ```

- **Response:**
  - Status Code: `200 OK`
  - Example Response:
  ```json
  {
    "data": {
      "id": "910692902668238849",
      "type": "posts",
      "attributes": {
        "title": "Updated Post Title",
        "body": "Hello World this is my comment",
        "created-at": "2023-10-22T16:23:37.996Z",
        "updated-at": "2023-10-22T16:25:58.116Z",
        "average-rating": 0
      },
      "relationships": {
        "user": {
          "data": {
            "id": "810153398351495169",
            "type": "users"
          }
        },
        "comments": {
          "data": []
        }
      },
      "links": {
        "self": "/api/v1/posts/910692902668238849"
      }
    }
  }
  ```

#### Delete Post

- **URL:** `api/v1/posts/:post_id`
- **Method:** `DELETE`
- **Description:** Delete a post.
- **Request:**
  - Headers: [List of required headers](#header-for-request)
- **Response:**

  - Status Code: `204 No Content`

### 3. Comments

#### Get Comments for a Post

- **URL:** `api/v1/posts/:post_id/comments`
- **Method:** `GET`
- **Description:** Get comments for a specific post.
- **Request:**

  - Headers: [List of required headers](#header-for-request)

- **Response:**

  - Status Code: `200 OK`

  - Example Response:

  ```json
  {
    "data": [
      {
        "id": "910184834594766849",
        "type": "comments",
        "attributes": {
          "message": "Illo facilis eaque soluta.",
          "user-id": 910184538004029441,
          "post-id": 910184678278135809,
          "average-rating": 0
        },
        "relationships": {
          "user": {
            "data": {
              "id": "910184538004029441",
              "type": "users"
            }
          },
          "post": {
            "data": {
              "id": "910184678278135809",
              "type": "posts"
            }
          }
        },
        "links": {
          "self": "/api/v1/posts/910184678278135809/comments/910184834594766849"
        }
      },
      {
        "id": "910184835091431425",
        "type": "comments",
        "attributes": {
          "message": "Debitis quia sed at.",
          "user-id": 910184624406790145,
          "post-id": 910184678278135809,
          "average-rating": 0
        },
        "relationships": {
          "user": {
            "data": {
              "id": "910184624406790145",
              "type": "users"
            }
          },
          "post": {
            "data": {
              "id": "910184678278135809",
              "type": "posts"
            }
          }
        },
        "links": {
          "self": "/api/v1/posts/910184678278135809/comments/910184835091431425"
        }
      }
    ],
    "included": [
      {
        "id": "910184538004029441",
        "type": "users",
        "attributes": {
          "username": "Fernande Collier",
          "email": "mica_gerlach@fahey.example",
          "name": "Tony Kshlerin",
          "avatar": null,
          "average-rating": 0
        },
        "relationships": {
          "posts": {
            "data": [
              {
                "id": "910184711192412161",
                "type": "posts"
              },
              {
                "id": "910184711822114817",
                "type": "posts"
              },
              {
                "id": "910184712477376513",
                "type": "posts"
              },
              {
                "id": "910184713107570689",
                "type": "posts"
              },
              {
                "id": "910184713742286849",
                "type": "posts"
              }
            ]
          },
          "user-ratings": {
            "data": []
          }
        }
      },
      {
        "id": "910184624406790145",
        "type": "users",
        "attributes": {
          "username": "Lupe O'Kon",
          "email": "taryn.mcdermott@hoppe.test",
          "name": "Shani Bergnaum III",
          "avatar": null,
          "average-rating": 0
        },
        "relationships": {
          "posts": {
            "data": [
              {
                "id": "910184783475802113",
                "type": "posts"
              },
              {
                "id": "910184783974039553",
                "type": "posts"
              },
              {
                "id": "910184784471883777",
                "type": "posts"
              },
              {
                "id": "910184784970448897",
                "type": "posts"
              }
            ]
          },
          "user-ratings": {
            "data": []
          }
        }
      }
    ],
    "links": {
      "self": "http://localhost:3001/api/v1/posts/910184678278135809/comments?page%5Bnumber%5D=1&page%5Bsize%5D=25",
      "first": "http://localhost:3001/api/v1/posts/910184678278135809/comments?page%5Bnumber%5D=1&page%5Bsize%5D=25",
      "prev": null,
      "next": null,
      "last": "http://localhost:3001/api/v1/posts/910184678278135809/comments?page%5Bnumber%5D=1&page%5Bsize%5D=25"
    },
    "meta": {
      "current-page": 1,
      "total-pages": 1,
      "total-count": 2
    }
  }
  ```

### 3. Comments

#### Get Comments for a Post

- **URL:** `/api/v1/posts/:post_id/comments`
- **Method:** `POST`
- **Description:** Create a new comment for a post.
- **Request:**
  - Headers: [List of required headers](#header-for-request)
  - Body:
  ```json
  {
    "comment": {
      "message": "Hello World this is my comment",
      "user_id": 909625609345564673,
      "post_id": 909634369425932289
    }
  }
  ```
- **Pageination Params:**  
   page
  per_page
- **Response:**
  - Status Code: `201 Created`
  - Example Response:
    ```json
    {
      "data": {
        "id": "909889845026291713",
        "type": "comments",
        "attributes": {
          "message": "Hello World this is my comment",
          "user-id": 909625609345564673,
          "post-id": 909634369425932289,
          "average-rating": 3
        },
        "relationships": {
          "user": {
            "data": {
              "id": "909625609345564673",
              "type": "users"
            }
          },
          "post": {
            "data": {
              "id": "909634369425932289",
              "type": "posts"
            }
          }
        },
        "links": {
          "self": "/api/v1/posts/909634369425932289/comments/909889845026291713"
        }
      }
    }
    ```

#### Get Comment by ID

- **URL:** `/api/v1/posts/:post_id/comments/:comment_id`
- **Method:** `GET`
- **Description:** Get a specific comment for a post by its ID.
- **Request:**
  - Headers: [List of required headers](#header-for-request)
- **Response:**
  - Status Code: `200 OK`
  - Example Response:
    ```json
    {
      "data": {
        "id": "910184834594766849",
        "type": "comments",
        "attributes": {
          "message": "Illo facilis eaque soluta.",
          "user-id": 910184538004029441,
          "post-id": 910184678278135809,
          "average-rating": 0
        },
        "relationships": {
          "user": {
            "data": {
              "id": "910184538004029441",
              "type": "users"
            }
          },
          "post": {
            "data": {
              "id": "910184678278135809",
              "type": "posts"
            }
          }
        },
        "links": {
          "self": "/api/v1/posts/910184678278135809/comments/910184834594766849"
        }
      },
      "included": [
        {
          "id": "910184538004029441",
          "type": "users",
          "attributes": {
            "username": "Fernande Collier",
            "email": "mica_gerlach@fahey.example",
            "name": "Tony Kshlerin",
            "avatar": null,
            "average-rating": 0
          },
          "relationships": {
            "posts": {
              "data": [
                {
                  "id": "910184711192412161",
                  "type": "posts"
                },
                {
                  "id": "910184711822114817",
                  "type": "posts"
                },
                {
                  "id": "910184712477376513",
                  "type": "posts"
                },
                {
                  "id": "910184713107570689",
                  "type": "posts"
                },
                {
                  "id": "910184713742286849",
                  "type": "posts"
                }
              ]
            },
            "user-ratings": {
              "data": []
            }
          }
        },
        {
          "id": "910184678278135809",
          "type": "posts",
          "attributes": {
            "title": "Third  post the job works",
            "body": "Hello World this is my comment",
            "created-at": "2023-10-20T21:18:40.190Z",
            "updated-at": "2023-10-21T17:38:44.414Z",
            "average-rating": 0
          },
          "relationships": {
            "user": {
              "data": {
                "id": "910153398351495169",
                "type": "users"
              }
            },
            "comments": {
              "data": [
                {
                  "id": "910184834594766849",
                  "type": "comments"
                },
                {
                  "id": "910184835091431425",
                  "type": "comments"
                }
              ]
            }
          },
          "links": {
            "self": "/api/v1/posts/910184678278135809"
          }
        }
      ]
    }
    ```

#### Update Comment

- **URL:** `/posts/:post_id/comments/:comment_id`
- **Method:** `PUT`
- **Description:** Update an existing comment for a post.
- **Request:**
  - Headers: [List of required headers](#header-for-request)
  - Body:
    ```json
    {
      "comment": {
        "message": "This is an updated comment."
      }
    }
    ```
- **Response:**
  - Status Code: `200 OK`
  - Example Response:
    ```json
    {
      "data": {
        "id": "910184834594766849",
        "type": "comments",
        "attributes": {
          "message": "This is an updated comment.",
          "user-id": 910184538004029441,
          "post-id": 910184678278135809,
          "average-rating": 0
        },
        "relationships": {
          "user": {
            "data": {
              "id": "910184538004029441",
              "type": "users"
            }
          },
          "post": {
            "data": {
              "id": "910184678278135809",
              "type": "posts"
            }
          }
        },
        "links": {
          "self": "/api/v1/posts/910184678278135809/comments/910184834594766849"
        }
      }
    }
    ```

#### Delete Comment

- **URL:** `/api/v1/posts/:post_id/comments/:comment_id`
- **Method:** `DELETE`
- **Description:** Delete a comment for a post.
- **Request:**
  - Headers: [List of required headers](#header-for-request)
- **Response:**
  - Status Code: `204 No Content`

## Error Handling

In case of errors, the API will respond with an appropriate HTTP status code and a JSON response containing details about the error.

- `400 Bad Request`: Invalid request data.
- `401 Unauthorized`: Authentication failed.
- `404 Not Found`: Resource not found.
- `500 Internal Server Error`: An internal server error occurred.

## Conclusion

This concludes the API documentation for our Rails API. If you have any questions or need further assistance, please feel free to contact me.

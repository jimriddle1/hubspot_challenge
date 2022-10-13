---

# Overview

- Take Home challenge in which the task was to consume two different end points using only Users that had deactivated Properties
- Explores a many to many relationship, where Users have many Properties through UserProperties, and vice versa

---

# Learning Goals

- Active Record Query to find Users with deactivated Properties
- Consume an API for two different post requests

---

# Schema - 

![Screen Shot 2022-10-12 at 7 04 17 PM](https://user-images.githubusercontent.com/99755958/195470807-563a5e9c-9581-464b-a83f-91cae6414689.png)

---

# API Consumption

- Endpoints Consumed:
  - [Create or update contact](#CREATE)
  - [Add existing contacts to a list](#ADD)

---

# CREATE


**Create or update contact**

- This endpoint creates a subscription 

Example:
	

``` ruby
[POST] /contacts/v1/contact/createOrUpdate/email/testingapis@hubspot.com/

 - Body: 
	 {
  "properties": [
    {
      "property": "firstname",
      "value": "HubSpot"
    },
    {
      "property": "lastname",
      "value": "Test"
    },
    {
      "property": "website",
      "value": "http://hubspot.com"
    },
    {
      "property": "company",
      "value": "HubSpot"
    },
    {
      "property": "phone",
      "value": "555-122-2323"
    },
    {
      "property": "address",
      "value": "25 First Street"
    },
    {
      "property": "city",
      "value": "Cambridge"
    },
    {
      "property": "state",
      "value": "MA"
    },
    {
      "property": "zip",
      "value": "02139"
    }
  ]
}

```

RESPONSE:

```json
{"vid":3234574,"isNew":false}
```
---

# ADD


**Add existing contacts to a list**

- This endpoint adds existing contacts to a list given a VIN or group of VIN's

Example:
	

``` ruby
[POST] [/api/v1/customers/#{customer.id}/subscriptions/#{subscription.id}](https://api.hubapi.com/contacts/v1/lists/226468/add

- Body:
	{
	  "vids": [
	    3057124,
		5524274
	  ],
	  "emails": [
	    "testingapis@hubspot.com"
	  ]
	}

```


RESPONSE:

```json
	{
	    "updated": [
		5524274,
		5531874,
		3057124
	    ],
	    "discarded": [

	    ],
	    "invalidVids": [

	    ],
	    "invalidEmails": [

	    ]
	}
```



---


# Feel like messing around?


## Installation

1. Clone this directory to your local repository using the SSH key:

```

$ git clone git@github.com:jimriddle1/hubspot_challenge.git

```

  

2. Install gems for development using [Bundler](https://bundler.io/guides/using_bundler_in_applications.html#getting-started---installing-bundler-and-bundle-init):

```

$ bundle install

```

  

3. Set up your database with:

```

$ rails db:{drop,create,migrate}

```

  

4. Run the test suite with:

```

$ bundle exec rspec

```

  

5. Run your development server with:

```

$ rails s

```

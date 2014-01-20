#Cic JS library v1.0.0

cic-js is a client wrapper which communicates with the [CIC API](http://developers.cic.mx/api/), and interact with it.


## Quick start

You have three options to install cic-js librayr and use it:

* Clone the repo: `git clone git@github.com:IcaliaLabs/cic-js.git`.
* Install via bower: `bower install cic-js`.
* Install via npm: `npm install cic-js`.

## Usage

The library provides 3 class objects:

### Report

#### Fetch report records 

To fetch the reports, you can just call the class method find()

```javascript
	Report.find()
```

You can send some options to the find method, in order to filter the request:

* limit - how many reports you want
* for_category - The category in which to filter the reports
* until  - Filter reports previous to the date in format YYY-MMD-DD
* async - Wheter or not you want the call to handle asyncronous
* callback - A function to call when the request has been success

Here is a quick example:

```javascript
	Report.find(
		{
			"limit": 1,
			"async": false,
			"for_category": 407,
			"until": "2014-01-19"
		}
	)
```

#### Save a report

It is really simple to create a report, we recommend you check the [CIC API](http://developers.cic.mx/api/) for defining the report attributes

```javascript
	report = new Report({
		"content": "The report content",
		"category": "ACCIDENTE"
		...
	});
	report.save(function(report) { //the callback is optional
		console.log(report.ticketId);
	});
```

There is a shorthand in here, if you want to create a report in one line:

```javascript
	report = Report.create({
		"content": "The report content",
		"category": "ACCIDENTE"
		...
	}, function(report){ //The callback function is optional in here
		console.log(report.ticketId);
	});
```

### Category

#### Fetch categories

To fetch the reports, you can just call the class method find()

```javascript
	Category.all()
```

You can send some options to the all method:

* options - Wheter or not you want the call to handle asyncronous
* callback - A function to call when the request has been success

Here is a quick example:

```javascript
	Category.all({
		"async": false
	}, function(categories){
		console.log(categories.length)
	});
```

### Group

#### Fetch groups

To fetch the reports, you can just call the class method find()

```javascript
	Group.all()
```

You can send some options to the all method:

* options - Wheter or not you want the call to handle asyncronous
* callback - A function to call when the request has been success

Here is a quick example:

```javascript
	Group.all({
		"async": false
	}, function(groups){
		console.log(groups)
	});
```

## Bug tracker & feature request

Have a bug or a feature request? [Please open a new issue](https://github.com/IcaliaLabs/cic-js/issues). Before opening any issue, please search for existing issues.

## Future
* Add some usage examples

## Contributing

Please submit all pull requests against a separate branch. Please follow the standard for naming the variables, mixins, etc.

## Authors

**Abraham Kuri**

+ [http://twitter.com/kurenn](http://twitter.com/kurenn)
+ [http://github.com/kurenn](http://github.com/kurenn)

## Copyright and license

Copyright 2014 Icalia Labs, Inc.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this work except in compliance with the License.
You may obtain a copy of the License in the LICENSE file, or at:

  [http://www.apache.org/licenses/LICENSE-2.0](http://www.apache.org/licenses/LICENSE-2.0)

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.


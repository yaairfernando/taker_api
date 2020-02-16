[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![LinkedIn][linkedin-shield2]][linkedin-url2]
[![Hireable][hireable]][hireable-url]

<!-- PROJECT LOGO -->
<br />
<p align="center">
 <h2 align="center"> Taker API </h2>

  <p align="center">
    Ruby on rails api
    <br />
    <a href="https://github.com/YairFernando67/taker_api"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    <a href="https://github.com/YairFernando67/taker_api">View Demo</a>
    ·
    <a href="https://github.com/YairFernando67/taker_api/issues">Report Bug</a>
    ·
    <a href="https://github.com/YairFernando67/taker_api/issues">Request Feature</a>
  </p>

</p>

## Table of Contents
* [About the Project](#about-the-project)
  * [Built With](#built-with)
* [Required Installations](#Required-Installations)
  * [Prerequisites](#Prerequisites)
  * [Installing](#Installing)
  * [Instructions](#Instructions)
* [Contact](#contact)
* [Contributing](#Contributing)
* [Show your support](#Show-your-support)

## About The Project

### Built With
The project was developed using the following technologies:
- [Ruby on Rails](https://rubyonrails.org/)
- [Mysql](https://rubygems.org/gems/mysql)

## Required Installations

### Prerequisites

This project runs on [Ruby](https://www.ruby-lang.org/en/documentation/installation/), and [Rails](http://installrails.com/)

* Ruby
* Rails

After installation, run `ruby -v` to make sure Ruby installed correctly. Example
```
$ ruby -v
ruby 2.6.4p104 (2019-08-28 revision 67798) [x86_64-linux]
```

Also make sure that Rails is installed, but running `rails -v`. 
Example
```
$ rails -v
Rails 6.0.2.1
```

### Installing

<p>Install the following to get this project running in your machine:</p>

### Instructions

<p>Follow these steps:</p>

Clone the Repository

```Shell
user@pc:~$ git clone https://github.com/YairFernando67/taker_api
```

Click on the console and to go to the folder that was created

```Shell
user@pc:~$ cd taker_api
```

```
user@pc:~/taker_api$ bundle install --without production
```

Set up the database by runnig the following command

```
user@pc:~/taker_api$  rails db:create
```

Download the database called db.sql and move it one directory up to your project

![DB Directory](app/img/code.png) 

Go to the config/database.yml file and modify the username and password with your mysql user credentials

![DB Directory](app/img/database.png) 

Run the following command to import the db.sql into your taker_api_development database 

```
user@pc:~/taker_api$ mysql -u username -p taker_api_development < db.sql
```

Next, run the migrations:

```
user@pc:~$ rails db:migrate
```

Run this command if you encountered a problem runing rails db:migrate

```
user@pc:~$ bundle exec rails db:migrate
```

Finally,  run the app in your local server:

```
user@pc:~$ rails server
```

Open your browser on [http://localhost:3000](http://localhost:3000)

## Contact

👤 **Yair Fernando Facio**

<a href="https://yairfernando67.github.io/Portfolio/" target="_blank">
    
  ![Screenshot Image](app/img/logo.jpg) 

</a>

- Github: [@YairFernando67](https://github.com/YairFernando67)
- Twitter: [@YairFernando18](https://twitter.com/YairFernando18)
- Linkedin: [softwaredeveloperyairfacio](https://www.linkedin.com/in/softwaredeveloperyairfacio/)
- Email: [yair.facio11@gmail.com](https://mail.google.com/mail/?view=cm&fs=1&tf=1&to=yair.facio11@gmail.com)
- Portfolio: [softwaredeveloper](https://yairfernando67.github.io/Portfolio/)

<p align="center">

  Project Link: [https://github.com/YairFernando67/taker_api](https://github.com/YairFernando67/taker_api)

</p>

## 🤝 Contributing

Contributions, issues and feature requests are welcome!

Feel free to check the [issues page](https://github.com/YairFernando67/taker_api/issues).

## Show your support

Give a ⭐️ if you like this project!

<!-- MARKDOWN LINKS & IMAGES -->
[contributors-shield]: https://img.shields.io/github/contributors/YairFernando67/taker_api.svg?style=flat-square
[contributors-url]: https://github.com/YairFernando67/taker_api/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/YairFernando67/taker_api.svg?style=flat-square
[forks-url]: https://github.com/YairFernando67/taker_api/network/members
[stars-shield]: https://img.shields.io/github/stars/YairFernando67/taker_api.svg?style=flat-square
[stars-url]: https://github.com/YairFernando67/taker_api/stargazers
[issues-shield]: https://img.shields.io/github/issues/YairFernando67/taker_api.svg?style=flat-square
[issues-url]: https://github.com/YairFernando67/taker_api/issues
[license-shield]: https://img.shields.io/github/license/YairFernando67/taker_api.svg?style=flat-square
[license-url]: https://github.com/YairFernando67/taker_api/blob/master/LICENSE.txt
[linkedin-shield2]: https://img.shields.io/badge/-LinkedIn-black.svg?style=flat-square&logo=linkedin&colorB=555
[linkedin-url2]: https://www.linkedin.com/in/softwaredeveloperyairfacio/
[hireable]: https://cdn.rawgit.com/hiendv/hireable/master/styles/flat/yes.svg
[hireable-url]: https://www.linkedin.com/in/softwaredeveloperyairfacio/
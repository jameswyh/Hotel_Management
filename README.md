# Hotel_Management
## Description
This system is a WEB-based hotel management system. The main purpose is to realize the electronic and automation of various internal management of the hotel management, improve the office efficiency of the hotel, and provide a guarantee for high-quality hotel services.
## Environment
### Website development environment:
1. Website development environment: Microsoft Visual Studio 2010 IDE.
2. Website development language: ASP.NET/C#.
3. Website database: Microsoft SQL Sever 2012.
4. Development environment operating platform: Windows 8/ Windows 10 / Windows 2000.
### Server:
1. Operating system: Windows 10.
2. Web server: IIS6.
3. Database server: Microsoft SQL Sever 2012.
4. Browser: Chrome browser/IE browser.
5. Web server operating environment: Chrome browser/IE browser.
### Client:
1. Browser: Chrome browser/IE browser.
2. Resolution: 1366×768 pixels.
## Function
1. Guest login and registration, receptionist login
2. Guest checks room types
3. Guest books rooms
4. Guest manages orders
5. Guest reviews
6. Receptionist manages the check-in and check-out of the room
7. Receptionist manages tenant accounts
8. Receptionist manages orders
9. Receptionist responds to user reviews
10. Receptionist manages room information
11. Receptionist manages room types

## Data Dictionary
### AdminInfo Form
| Field name | Primary key | Type | Length | Allow empty | Field description |
| ----------- | ----------- | ----------- | ----------- |----------- | ----------- |
| userid | √ | int | 10 | | Receptionist ID |
| username| | nvarchar | 20 | √ | Receptionist username |
| password| | nvarchar | 20 | √ | Receptionist password |

### CustomerInfo Form
| Field name | Primary key | Type | Length | Allow empty | Field description |
| ----------- | ----------- | ----------- | ----------- |----------- | ----------- |
| userid | √ | int | 10 | | Guest ID |
| username | | nvarchar | 20 | √ | Guest username |
| name | | nvarchar | 50 | √ | Guest name |
| password | | nvarchar | 20 | √ | Guest password |
| email | | nvarchar | 50 | √ | Guest email |

### RoomInfo Form
| Field name | Primary key | Type | Length | Allow empty | Field description |
| ----------- | ----------- | ----------- | ----------- |----------- | ----------- |
| riid | √ | int | 10 | | Room ID |
| rino | | numeric | 5 | √ | Room number |
| rtname | | nvarchar | 10 | √ | Room type name |
| rifloor | | int | 10 | √ | Room floor |
| ristate | | nvarchar | 50 | √ | Room status |
| riother | | nvarchar | 50 | √ | Other information |
| orderno | | nvarchar | 50 | √ | Order ID |

### RoomType Form
| Field name | Primary key | Type | Length | Allow empty | Field description |
| ----------- | ----------- | ----------- | ----------- |----------- | ----------- |
| rtid | √ | int | 10 | | Room Type ID |
| rtname | | nvarchar | 10 | √ | Room type name |
| rtarea | | numeric | 3 | √ | Area |
| rtpeople | | numeric | 1 | √ | Number of residents |
| rtnet | | nvarchar | 50 | √ | Broadband network |
| rtfacility | | nvarchar | 100 | √ | Indoor facilities |
| rtbath | | nvarchar | 100 | √ | Bathing facilities |
| rtother | | nvarchar | 50 | √ | Other information |
| rtprice | | numeric | 18 | √ | Price |
| rtpic_s | | nvarchar | 50 | √ | Small thumbnail |
| rtpic_l | | nvarchar | 50 | √ | Large thumbnail |
| rtamount | | int | 10 | √ | Number of rooms |

### OrderInfo Form
| Field name | Primary key | Type | Length | Allow empty | Field description |
| ----------- | ----------- | ----------- | ----------- |----------- | ----------- |
| orderno | √ | int | 10 | | Order ID | 
| username | | nvarchar | 50| √ | Guest username |
| name | | nvarchar | 50 | √ | Guest name |
| idcard | | nvarchar | 50 | √ | Guest ID |
| rtname | | nvarchar | 10 | √ | Room type name |
| phone | | nvarchar | 20 | √ | Guest phone number |
| email | | nvarchar | 50 | √ | Guest email |
| checkin | | datetime | 23 | √ | Checkin time |
| arrivetime | | nvarchar | 50 | √ | Arrival time |
| checkout | | datetime | 23 | √ | Checkout time |
| price | | nvarchar | 50 | √ | Order price |
| state | | nvarchar | 50 | √ | Order status |
| amount | | nvarchar | 50 | √ | Amount of rooms |
| room | | nvarchar | 50 | √ | Room number |
| comment | | nvarchar | 50 | √ | Comment status |
| canceldate | | datetime | 23 | √ | Cancel date |
| deposit | | nvarchar | 50 | √ | Deposit status |

### CommentInfo Form
| Field name | Primary key | Type | Length | Allow empty | Field description |
| ----------- | ----------- | ----------- | ----------- |----------- | ----------- |
| commentid | √ | int | 10 | | Comment ID |
| orderno || nvarchar | 50 | √ | Order ID |
| username || nvarchar | 10 | √ | Guest username |
| date || datetime | 23 | √ | Comment date |
| score || nvarchar | 50 | √ | Comment score |
| comment || nvarchar | 100 | √ | Comment content |
| reply || nvarchar | 100 | √ | Comment reply |

## User Interface
![](https://github.com/jameswyh/Hotel_Management/blob/master/Hotel_UI_pic/Picture1.png)
![](https://github.com/jameswyh/Hotel_Management/blob/master/Hotel_UI_pic/Picture2.png)
![](https://github.com/jameswyh/Hotel_Management/blob/master/Hotel_UI_pic/Picture3.png)
![](https://github.com/jameswyh/Hotel_Management/blob/master/Hotel_UI_pic/Picture4.png)

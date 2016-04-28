//
//  Strings.swift
//  campusrec-ios
//
//  Created by Tyler Hunnefeld on 4/5/16.
//  Copyright © 2016 ThinkBig Applications. All rights reserved.
//

import Foundation


//***************************************************
// MARK, - Menu
//***************************************************

let MENU_STRING_ARRAY : Array<Array<String>> = [
    ["Home","ic_home"],
    ["Calendar","ic_date_range"],
    ["Intramural Sports","ic_group"],
    ["Reservations","ic_add_shopping_cart"],
    ["Contact Us","ic_send"]
]

//***************************************************
// MARK: - Colors
//***************************************************

/*
 
 From Site:
 Main Background: #FFFFFF
 Accent: #862633
 Secondary Background: #F5F5F5
 Primary Text: #292F33
 Odd numbered rows: #F9F9F9
 
*/

let COLOR_PRIMARY_BACKGROUND = UIColor(netHex: 0xFFFFFF)
let COLOR_ACCENT = UIColor(netHex: 0x862633)
let COLOR_SECONDARY_BACKGROUND = UIColor(netHex: 0xF5F5F5)
let COLOR_PRIMARY_TEXT = UIColor(netHex: 0x292F33)
let COLOR_ODD_ROWS = UIColor(netHex: 0xF9F9F9)
let COLOR_ACCENT_DARK = UIColor(netHex: 0x761013)

let COLOR_GARNET = UIColor(netHex: 0x782F40)
let COLOR_GOLD = UIColor(netHex: 0xCEB888)

//***************************************************
// MARK: - Locations
//***************************************************


let LOCATION_STRING_ARRAY = [
    "Leach Recreation Center",
    "FSU Reservation",
    "Fitness & Movement Clinic",
    "Rec SportsPlex",
    "Main Campus Fields",
    "Westside Courts"
]

let LOCATION_IMAGE_ARRAY = [
    "leach",
    "FSU-Res",
    "wellness center",
    "recsportsplex",
    "imfields",
    "westsidecourts"
]



//***************************************************
// MARK: - Calendar Settings
//***************************************************

let SHOULD_SHOW_DAYS_OUT = true



//***************************************************
// MARK: - Contact
//***************************************************

let CONTACT_CATEGORY_STRING = [
    "Campus Rec Administrative Offices",
    "Leach center | Fitness | Aquatics",
    "Fitness & Movement Clinic | Wellness"
]

//***************************************************
// MARK: - Status
//***************************************************

let STATUS_HEADER_ARRAY = [
    "Operating Hours",
    "Detailed Information",
    "Contact Us"
]

let OPERATING_HOURS_TEXT = [
    //Leach
    " S: 8:00 AM - 5:00 PM \n M: 6:00 AM - 11:00 PM \n T: 6:00 AM - 11:00 PM \n W: 6:00 AM - 11:00 PM \n T: 6:00 AM - 11:00 PM \n F: 6:00 AM - 10:00 PM \n S: 8:00 AM - 5:00 PM",
    //Res
    " S: 12 PM - 7:00 PM \n M: 2:00 PM - 7:00 PM \n T: 2:00 PM - 7:00 PM \n W: 2:00 PM - 7:00 PM \n T: 2:00 PM - 7:00 PM \n F: 12 PM - 7:00 PM \n S: 12 PM - 7:00 PM",
    //Movement clinic
    " S: 8:00 AM - 5:00 PM \n M: 6:00 AM - 9:00 PM \n T: 6:00 AM - 9:00 PM \n W: 6:00 AM - 9:00 PM \n T: 6:00 AM - 9:00 PM \n F: 6:00 AM - 9:00 PM \n S: 8:00 AM - 5:00 PM",
    //Rec SportsPlex
    " S: 5:30 PM - 10:30 PM \n M: 5:30 PM - 10:30 PM \n T: 5:30 PM - 10:30 PM \n W: 5:30 PM - 10:30 PM \n T: 5:30 PM - 10:30 PM \n F: Closed \n S: Closed",
    //Main campus fields
    " S: Open until 9:00 PM \n M: Open until 10:00 PM \n T: Open until 10:00 PM\n W: Open until 10:00 PM \n T: Open until 10:00 PM \n F: Open until 10:00 PM \n S: Open until 9:00 PM",
    //Westside courts
    " S: Open until 9:00 PM \n M: Open until 10:00 PM \n T: Open until 10:00 PM\n W: Open until 10:00 PM \n T: Open until 10:00 PM \n F: Open until 10:00 PM \n S: Open until 9:00 PM",
]

let DETAILED_INFO_TEXT = [
    //Leach
    "The Bobby E. Leach Student Recreation Center is a 120,000 square foot fitness facility located right in the heart of campus. Users are required to present current, valid FSUCard to access the facility. \n \n Cardio & Strength Equipment \n \n Want to get a good cardiovascular workout? We have nearly 100 cardiovascular machines including treadmills, stair climbers, ellipticals, bikes, and rowers. Hit the weights with pieces from Hammer Strength, Cybex, LifeFitness, FreeMotion, and more! And, we have over 6,500 lbs of dumbbells! Dumbbell sets range from 3 pounds all the way up to 120 pounds in three areas of the gym to accommodate all patrons. You can also work out using over 60 plate-loaded machines and benches to train all muscle groups! You are sure to find equipment for a great workout. \n \n Sport Courts & Indoor Track \n \n Hoop it up on the sport courts: Three regulation-size basketball courts on the upper level of the Leach Center. Courts 1 and 2 are available for pick-up basketball, while Court 3 is designated for other sports such as volleyball (see the Front Desk for equipment), table tennis, and badminton. Racquet sports enthusiasts can take advantage of our five racquetball & squash courts for recreational matches anytime the Leach is open. Racquetball court reservations are available online through  Rec Connect. \n \n Leach Pool and Spa \n \n The Leach Pool is a 16-lane by 25-yard indoor swimming facility with two 1-meter and two 3-meter diving boards. A complete spa area is located just off the pool deck and is equipped with two whirlpools, two steam rooms, and a sauna. Visit our Aquatics pages for complete details. \n \n Fitness Programs and Services \n \n Students and members can take advantage of over 100 free group fitness classes offered weekly along with personal training provided by our NSCA-certified personal trainers. Our wellness staff offers a variety of comprehensive wellness services to help members develop healthy training and nutrition habits. \n \n Atrium area \n \n Kick back after your workout in the spacious atrium area complete with plenty of seating and big-screen TVs for a true couch potato experience. Plus, you can get a smoothie or wrap and other healthy snacks at our snack bar adjacent to the Front Desk.",
    //Res
    "The Florida State University Reservation is a 73-acre facility, with 10 active acres, located on beautiful Lake Bradford. The \"Rez\" is located 1/4 mile from the airport and four miles from the Florida State campus. In our unique natural setting you can enjoy canoeing, kayaking, picnicking, swimming, sand volleyball, disc golf, and many other activities. \n \n Swim in Lake Bradford \n \n Take a dip in our guarded, designated swimming area. Children under age 15 must pass a swim test to swim in the deep water. Or, simply enjoy our sandy beach and catch some rays! \n \n Get on the Water \n \n Enjoy an hour of canoeing and kayaking on Lake Bradford or one of the three adjoining lakes. Or, try a stand-up paddleboard. Kayak, canoe and paddleboard rentals are available (FREE for FSU students). Go big with a sailboat, rentals also available from the Rez. Guests wishing to rent one of our sailboats must participate in one of our scheduled sailing clinics to ensure safe handling of equipment and to test skill proficiency prior to rentals. Sailing clinics are offered throughout our season. \n \n Enjoy Outdoor Games \n \n How about some sand volleyball, a game of horseshoes, cornhole or Spikeball, or a round of disc golf? It's all free with park admission. Two sand volleyball courts are available for patrons during normal waterfront hours. And, nine holes of disc golf wind their way throughout the property. Sports equipment is available for checkout at the Waterfront Office. \n \nScale the Wall \n \nClimb our 40-foot climbing wall, part of the FSU Challenge Course. You must have closed toe shoes to climb the wall. The Climbing Wall is accessible during park hours each weekend. A small fee applies for non-FSU students and the general public. \n \nStay in the Shade \n \nGet into the shade and take part in a game of table tennis in our rec hall, located adjacent to the waterfront. Table tennis balls and paddles can be checked out at the Waterfront Office. \n \nRent a Pavilion \n \nEnjoy even more shade under our pavilions, available for reservation and rental by various groups. Enjoy food hot off the grill, a charcoal grill and picnic tables are available with each pavilion. Please bring your own charcoal and grill brush.Visit our Facility Rentals page for details. \n \nProhibited Items \n \n Come out and relax by the lake but leave a few things at home: Alcohol and pets are not allowed at the Rez.",
    //Movement clinic
    "Campus Recreation's newest facility, the Fitness & Movement Clinic (FMC) is located inside the University's Health & Wellness Center. Opened in 2012, the FMC offers more than 12,000 square feet of space for strength and cardio training and also encompasses a private studio for small group training classes and space for wellness testing and consultation. Users are required to present current, valid FSUCard to access the facility. \n \n Cardio & Strength Equipment \n \n 26 Precor cardio pieces with 15-inch touchscreen monitors \n 8 Woodway Treadmills, two of which are self-propelling \n 4 Cybex Body Arc Trainers \n 10 FreeMotion circuit pieces / 14 Life Fitness circuit pieces \n 10 Life Fitness cardio pieces with 15-inch LCD screen \n 10 FreeMotion circuit pieces / 14 Life Fitness circuit pieces \n 1 Life Fitness Four Station MultiJungle \n 3 TRX multimount stations \n Assortment of dumbbells, barbells, kettlebells",
    //Rec SportsPlex
    "Winner of the 2010 NIRSA Outstanding Sports Facilities national award for excellence in recreational sports facilities, this 108-acre recreational sports fields facility on FSU's Southwest Campus encompasses 21 sports fields and additional activity spaces. Among the 21 fields are 12 multipurpose fields for IM flag football and rec soccer, 4 tournament fields for sport club activities such as rugby and lacrosse, and 5 separate softball diamonds. The Rec SportsPlex is a limited-access facility, providing space for the recreational activities of current FSU students, faculty, and staff during designated open hours only, weather permitting.",
    //Main campus fields
    "Formerly the Intramural Sports Complex, the Main Campus Fields provide students and staff recreational sports field space on FSU's main campus. The facility comprises 13 acres and encompasses 4 sports fields. The Main Campus Fields is an open-access facility, providing space for the recreational activities of current FSU students, faculty, and staff during daylight hours, weather permitting. Evening hours with lighted fields are available on weekday nights during the fall and spring semesters. Users may be required to present current, valid FSUCard during prime hours to access the facility.",
    //Westside courts
    "Renovated in 2009, the Westside Courts (formerly known as the Salley Hall Courts) behind Salley Hall and near Fresh Food Company on the westside of FSU's Main Campus features 2 outdoor basketball courts, 2 outdoor tennis courts, and a sand volleyball court along with a new pavilion space with restrooms, water fountains, picnic tables, and an equipment checkout service. The Westside Courts is an open-access facility, providing space for the recreational activities of current FSU students, faculty, and staff during daylight hours, weather permitting. Evening hours with lighted courts are available on weekday nights during the fall and spring semesters. Users may be required to present current, valid FSUCard during prime hours to access the facility.",
]



let CONTACT_LOCATION_INFO : Array<String> = [
    "Campus Rec Administrative Offices",
    "Leach Center / Fitness / Aquatics",
    "Fitness & Movement Clinic / Wellness",
    "Intramural Sports",
    "Competitive Sports Facilities / Sport Clubs",
    "FSU Reservation / Outdoor Pursuits / FSU Challenge / Camp Flastacowo"
]

let CONTACT_ADMIN_ARRAY : Array<Array<String>> = [
        ["Pattie Malarney","Senior Associate Director","8506448606"],
        ["David Peters","Associate Director","8506447698"],
        ["Alex Marse","Assistant Director, Marketing & Special Events","8506450353"],
        ["Jenna Ulewicz","Human Resources Specialist","8506440549"],
        ["Kasony Sims","Senior Accountant","8506440555"],
        ["Jordan Elmore","Accountant","8506440554"],
        ["Ian Michael","Administrative Assistant","8506450792"],
        ["Bobby Broome","Maintenance Superintendent","8506440545"]
]

        
let CONTACT_LEACH_ARRAY : Array<Array<String>> = [
    ["General Information", "Leach Center Front Desk",	"8506440548"],
    ["Darryl Lovett","Assistant Director, Fitness Facility Operations",	"8506450475"],
    ["Lynn Grasso",	"Assistant Director, Fitness Programs",	"8506440546"],
    ["Mike DiBiasi","Coordinator, Strength & Conditioning",	"8506441613"],
    ["General Info","Group Fitness Office",	"8506440547"],
    ["Suzi Berkey",	"Coordinator, Member Services",	"8506440550"]
]

let CONTACT_WELLNESS_ARRAY: Array<Array<String>> = [
    ["General Info","FMC Front Desk", "8506450601"],
    ["April Moore","Assistant Director, Wellness Education & Outreach","8506450603"]
]

let CONTACT_IM_ARRAY : Array<Array<String>> = [
    ["General Info","Intramural Sports Office", "8506442430"],
    ["Chris Schmoldt","Assistant Director, Intramural Sports","8506440552"],
    ["Ben Holmes","Coordinator, Intramural Sports","8506444925"],
    ["Antonio Gonzalez","Coordinator, Intramural Sports","8506450386"]
]

let CONTACT_CLUBS_ARRAY : Array<Array<String>> = [
    ["General Info","Sport Club Program Office","8506447902"],
    ["Mike Collins","Assistant Director, Competitive Sports & Facilities",	"8506447699"],
    ["Christian Obando","Coordinator, Sport Clubs",	"8506450923"],
    ["Andrew Funari","Graduate Assistant, Competitive Sports",	"8506450922"]
]

let CONTACT_RES_ARRAY : Array<Array<String>> = [
    ["General Info","Outdoor Pursuits & Rez Waterfront","8506442449"],
    ["General Info","Rez Admin Office","8506446892"],
    ["Jen McKee","Assistant Director, Rez Operations & Risk Management","8506444531"],
    ["Jordan Merrick" ,"Assistant Director, Outdoor & Experiential Programs","8506446124"],
    ["Travis Johnson" ,"Coordinator, Outdoor Pursuits","8506452750"]
]


//Form:
//  Name, 
//  Open hours, 
//  Closed hours,  
//  Address, 
//  Phone number
let LOCATION_INFO : Array<Array<AnyObject>> = [
    ["Leach Recreation Center",
        ["11:00","06:00","06:00","06:00","06:00","06:00","11:00"],
        ["21:00","23:00","23:00","23:00","23:00","22:00","21:00"],
        "118 Varsity Way, Tallahassee, FL 32306",
        "8506440548"],
    ["FSU Reservation",
        ["12:00","14:00","14:00","14:00","14:00","12:00","12:00"],
        ["19:00","19:00","19:00","19:00","19:00","19:00","19:00"],
        "3226 Flastacowo Road, Tallahassee, FL 32310",
        "8506446892"],
    ["Fitness & Movement Clinic",
        ["08:00","06:00","06:00","06:00","06:00","06:00","08:00"],
        ["17:00","21:00","21:00","21:00","21:00","21:00","17:00"],
        "960 Learning Way, Tallahassee, FL 32306",
        "8506450601"],
    ["Rec SportsPlex",
        ["05:30","06:30","06:30","06:30","06:30","Closed", "Closed"],
        ["22:30","22:30","22:30","22:30","22:30","Closed","Closed"],
        "3950 Tyson Rd, Tallahassee, FL 32310",
        "8506457246"],
    ["Main Campus Fields",
        ["Sunrise","Sunrise","Sunrise","Sunrise","Sunrise","Sunrise","Sunrise"],
        ["Sunset","Sunset","Sunset","Sunset","Sunset","Sunset","Sunset"],
        "1001 W. St. Augustine Street, Tallahassee, 32306 ",
        "8506447902"],
    ["Westside Courts",
        ["Sunrise","Sunrise","Sunrise","Sunrise","Sunrise","Sunrise","Sunrise"],
        ["Sunset","Sunset","Sunset","Sunset","Sunset","Sunset","Sunset"],
        "240 Hull Drive, Tallahassee, 32306",
        "8506447902"]
]






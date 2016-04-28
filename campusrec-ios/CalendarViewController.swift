//
//  CalendarViewController.swift
//  campusrec-ios
//
//  Created by Tyler Hunnefeld on 4/7/16.
//  Copyright © 2016 ThinkBig Applications. All rights reserved.
//

import UIKit
import CVCalendar

class CalendarViewController: UIViewController,
    CVCalendarViewDelegate,
    CVCalendarMenuViewDelegate,
    CVCalendarViewAppearanceDelegate
    {
    
    //***************************************************
    // MARK: - Outlets and Variables
    //***************************************************
    
    //Menu

    @IBOutlet var menuButton: UIBarButtonItem!
    
    //Calendar
    
    @IBOutlet var monthLabel: UILabel!
    @IBOutlet var menuView: CVCalendarMenuView!
    @IBOutlet var calendarView: CVCalendarView!
    var selectedDay: DayView!
    
    //View
    
    
    
    //***************************************************
    // MARK: - View Lifecycle
    //***************************************************

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        monthLabel.text = CVDate(date: NSDate()).globalDescription
        
        
        self.calendarView.calendarAppearanceDelegate = self
        self.calendarView.animatorDelegate = self

        
        if self.revealViewController() != nil {
            menuButton.target = self
            menuButton.action = "pressedMenuButton"
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        // Commit frames' updates
        self.calendarView.commitCalendarViewUpdate()
        self.menuView.commitMenuViewUpdate()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    
    //***************************************************
    // MARK: - Calender Delegate Methods
    //***************************************************
    
    func presentationMode() -> CalendarMode {
        return .MonthView
    }
    
    func firstWeekday() -> Weekday {
        return .Sunday
    }
    
    ///Changes the top day to the selected day
    func didSelectDayView(dayView: CVCalendarDayView, animationDidFinish: Bool) {
        print("\(dayView.date.commonDescription) is selected!")
        
        monthLabel.text = dayView.date.commonDescription
        selectedDay = dayView
    }
    
    func shouldShowWeekdaysOut() -> Bool {
        return SHOULD_SHOW_DAYS_OUT
    }
    
    func topMarker(shouldDisplayOnDayView dayView: CVCalendarDayView) -> Bool {
        return true
    }
    
    func dayLabelWeekdaySelectedBackgroundColor() -> UIColor {
        return COLOR_ACCENT
    }
    
    //Changes Current day text color when not selected
    func dayLabelPresentWeekdayTextColor() -> UIColor {
        return COLOR_ACCENT
    }
    
    func dayLabelPresentWeekdayInitallyBold() -> Bool {
        return true
    }

    func dayLabelPresentWeekdaySelectedBackgroundColor() -> UIColor {
        return COLOR_GOLD
    }
    
    /*func dayLabelPresentWeekdaySelectedTextColor() -> UIColor {
        return COLOR_PRIMARY_TEXT
    }*/
    
       
    //***************************************************
    // MARK: - Custom Methods
    //***************************************************
    
 

    ///Called on menuButton press
    func pressedMenuButton() {
        
        self.revealViewController().revealToggle(self)
    }

}

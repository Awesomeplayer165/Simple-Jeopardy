//
//  ViewController.swift
//  Simple Geopardy
//
//  Created by Jacob Trentini on 3/1/22.
//

import UIKit

class Jeopardy {
    let question: String
    let answer:   String
    
    init(question: String, answer: String) {
        self.question   = question
        self.answer     = answer
    }
}

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var teamOneLabel = UILabel()
    var teamTwoLabel = UILabel()
    
    let headers = ["Maths",
                   "Science",
                   "History",
                   "Computer Science"]
    
    var points = [
        [100, 200, 300, 400],
        [100, 200, 300, 400],
        [100, 200, 300, 400],
        [100, 200, 300, 400]]
    
    var questions: [IndexPath: Jeopardy] = [
        IndexPath(row: 0, section: 0): Jeopardy(question: "Example Question 0, 0", answer: "Example Answer"),
        IndexPath(row: 1, section: 0): Jeopardy(question: "Example Question 0, 1", answer: "Example Answer"),
        IndexPath(row: 2, section: 0): Jeopardy(question: "Example Question 0, 2", answer: "Example Answer"),
        IndexPath(row: 3, section: 0): Jeopardy(question: "Example Question 0, 3", answer: "Example Answer"),
        
        IndexPath(row: 0, section: 1): Jeopardy(question: "Example Question 1, 0", answer: "Example Answer 1, 0"),
        IndexPath(row: 1, section: 1): Jeopardy(question: "Example Question 1, 1", answer: "Example Answer 1, 1"),
        IndexPath(row: 2, section: 1): Jeopardy(question: "Example Question 1, 2", answer: "Example Answer 1, 2"),
        IndexPath(row: 3, section: 1): Jeopardy(question: "Example Question 1, 3", answer: "Example Answer 1, 3"),
        
        IndexPath(row: 0, section: 2): Jeopardy(question: "Example Question 2, 0", answer: "Example Answer 2, 0"),
        IndexPath(row: 1, section: 2): Jeopardy(question: "Example Question 2, 1", answer: "Example Answer 2, 1"),
        IndexPath(row: 2, section: 2): Jeopardy(question: "Example Question 2, 2", answer: "Example Answer 2, 2"),
        IndexPath(row: 3, section: 2): Jeopardy(question: "Example Question 2, 3", answer: "Example Answer 2, 3"),
    ]
    
    @objc func didChangeFirstStepperValue(_ sender: UIStepper) {
        print("Changed First Value to \(sender.value)")
        teamOneLabel.text = "Team One: \(sender.value)"
    }
    
    @objc func didChangeSecondStepperValue(_ sender: UIStepper) {
        print("Changed Second Value to \(sender.value)")
        teamTwoLabel.text = "Team Two: \(sender.value)"
        dump(teamTwoLabel.frame)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate   = self
        tableView.dataSource = self
        
//        let firstTeamView: UIView = {
//            let view = UIView(frame: CGRect(x: 10, y: tableView.frame.maxY + 20, width: self.view.frame.midX - 10, height: (self.view.frame.maxY - tableView.frame.maxY) - 20))
//            view.backgroundColor = .secondarySystemGroupedBackground
//            view.layer.cornerRadius = 10
//            return view
//        }()
//
//        teamOneLabel.text = "Team One: 0"
//        teamOneLabel.center = firstTeamView.center
//        teamOneLabel.textAlignment = .center
//
//        let secondTeamView: UIView = {
//            let view = UIView(frame: CGRect(x: firstTeamView.frame.maxX + 10, y: tableView.frame.maxY, width: self.view.frame.midX - 20, height: (self.view.frame.maxY - tableView.frame.maxY) - 10))
//            view.backgroundColor = .secondarySystemGroupedBackground
//            view.layer.cornerRadius = 10
//            return view
//        }()
//
//        teamTwoLabel.text = "Team Two: 0"
//        teamTwoLabel.center = secondTeamView.center
//        teamTwoLabel.textAlignment = .center
//
//        let teamOneStepper: UIStepper = {
//            let stepper = UIStepper()
//            stepper.center = firstTeamView.center
//            stepper.center.y += 40
//            stepper.addTarget(self, action: #selector(didChangeFirstStepperValue(_:)), for: .touchUpInside)
//            stepper.maximumValue = 999_999_999
//            stepper.stepValue = 100
//            return stepper
//        }()
//
//        let teamTwoStepper: UIStepper = {
//            let stepper = UIStepper()
//            stepper.center = secondTeamView.center
//            stepper.center.y += 40
//            stepper.addTarget(self, action: #selector(didChangeSecondStepperValue(_:)), for: .touchUpInside)
//            stepper.maximumValue = 999_999_999
//            stepper.stepValue = 100
//            return stepper
//        }()
//
//        firstTeamView.addSubview(teamOneLabel)
//        firstTeamView.addSubview(teamOneStepper)
//
//        secondTeamView.addSubview(teamTwoLabel)
//        secondTeamView.addSubview(teamTwoStepper)
//
//        view.addSubview(firstTeamView)
//        view.addSubview(secondTeamView)
        
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return headers.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "question", for: indexPath)
        
        cell.textLabel?.text = "\(points[indexPath.section][indexPath.row])"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return headers[section]
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 30

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let questionVC = storyboard?.instantiateViewController(withIdentifier: "Question") as! Question
        questionVC.jeopardy = questions[indexPath]
        present(questionVC, animated: true, completion: nil)
    }
    
}


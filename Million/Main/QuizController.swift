//
//  QuizController.swift
//  Million
//
//  Created by Yusıf Aqakerımov on 10.10.24.
//

import UIKit

class QuizController: UIViewController {

    @IBOutlet private weak var collection: UICollectionView!
    private var questions: [Question] = []
    private var result:[Answer] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        generateQuestions()
        configureView()
        view.backgroundColor = .backgroundGray
    }

    fileprivate func configureView() {
        configureCollection()
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    fileprivate func configureCollection() {
        collection.delegate = self
        collection.dataSource = self
        collection.register(UINib(nibName: "AnswerCollectionCell", bundle: nil), forCellWithReuseIdentifier: "AnswerCollectionCell")
       // collection.isScrollEnabled = false
    }
    
    fileprivate func generateQuestions() {
        questions = [
            Question(
                title: "1+3",
                answer: [
                    Answer(title: "1", correct: false),
                    Answer(title: "2", correct: false),
                    Answer(title: "3", correct: false),
                    Answer(title: "4", correct: true),
                    
                ]
            ),
            Question(
                title: "2+3",
                answer: [
                    Answer(title: "1", correct: false),
                    Answer(title: "2", correct: false),
                    Answer(title: "3", correct: false),
                    Answer(title: "5", correct: true),
                    
                ]
            ),
            Question(
                title: "3+3",
                answer: [
                    Answer(title: "1", correct: false),
                    Answer(title: "2", correct: false),
                    Answer(title: "3", correct: false),
                    Answer(title: "6", correct: true),
                    
                ]
            )
        ]
        
        reloadCollection()
    }
    
    fileprivate func reloadCollection() {
        DispatchQueue.main.async { [weak self] in
            self?.collection.reloadData()
        }
    }
    
    fileprivate func checkAnswer(answer: Answer) {
        result.append(answer)
//        if answer.correct {
//            result = result + 1
//        }
        print(#function, result.filter({$0.correct}).count)
    }

}

extension QuizController: UICollectionViewDelegate,
                              UICollectionViewDataSource,
                              UICollectionViewDelegateFlowLayout {

    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        questions.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AnswerCollectionCell", for: indexPath) as! AnswerCollectionCell
        let model = questions[indexPath.row]
        cell.configureCell(model: model)
        cell.callback = { [weak self] answer in
            self?.checkAnswer(answer: answer)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: collectionView.frame.width, height: collectionView.frame.height)
    }
}

//
//  AnswerCell.swift
//  Million
//
//  Created by Yusıf Aqakerımov on 10.10.24.
//

import UIKit

class AnswerCollectionCell: UICollectionViewCell {
    
    @IBOutlet private weak var collection: UICollectionView!
    private var question: Question?
    var callback:( (Answer) -> Void )?
    var isanswerselected = false
    
    var list: [Int] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureCollection()
        
    }
    
    fileprivate func configureCollection() {
        collection.delegate = self
        collection.dataSource = self
        collection.backgroundColor = .backgroundGray
        collection.register(UINib(nibName: "AnswerCell", bundle: nil), forCellWithReuseIdentifier: "AnswerCell")
        collection.register(UINib(nibName: "QuestionHeader", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "QuestionHeader")
        
    }
    
    func configureCell(model: Question) {
        question = model
        reloadCollection()
    }
    
    fileprivate func reloadCollection() {
        DispatchQueue.main.async { [weak self] in
            self?.collection.reloadData()
        }
    }
    
    fileprivate func setColor(index: Int) {
        guard let answer = question?.answer[index] else {return}
        question?.answer[index].color = answer.correct ? .green : .red
        reloadCollection()
    }
}

extension AnswerCollectionCell: UICollectionViewDelegate,
                                UICollectionViewDataSource,
                                UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        question?.answer.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AnswerCell", for: indexPath) as! AnswerCell
        guard let answer = question?.answer[indexPath.row] else {return UICollectionViewCell()}
        cell.configureCell(model: answer)
        cell.layer.cornerRadius = 20
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(
            width: collectionView.frame.width - 10,
            height: collectionView.frame.height/10 - 10
        )
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: collectionView.frame.width, height: collectionView.frame.height/3)
    }
    func collectionView(
        _ collectionView: UICollectionView,
        viewForSupplementaryElementOfKind kind: String,
        at indexPath: IndexPath
    ) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "QuestionHeader", for: indexPath) as! QuestionHeader
            guard let model = question else {return UICollectionReusableView()}
            header.configureView(model: model)
            return header
        default:
            return UICollectionReusableView()
        }
        
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath
    ) {
        guard !isanswerselected else {return}
        
        isanswerselected = true
        guard let answer = question?.answer[indexPath.row] else {return}
        setColor(index: indexPath.row)
        callback?(answer)
    }
    
    
}

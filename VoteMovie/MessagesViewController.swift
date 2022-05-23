//
//  MessagesViewController.swift
//  VoteMovie
//
//  Created by Abdhi P (Academy) on 17/05/22.
//

import UIKit
import Messages

class MessagesViewController: MSMessagesAppViewController {
    
    @IBOutlet weak var voteMovieOneView: UIStackView!
    @IBOutlet weak var titleMovieOneLbl: UILabel!
    @IBOutlet weak var thumbnailMovieOneImg: UIImageView!
    @IBOutlet weak var voteMovieOneBackgroundView: UIView!
    @IBOutlet weak var voteMovieOneLbl: UILabel!
    @IBOutlet weak var voteMovieTwoView: UIStackView!
    @IBOutlet weak var titleMovieTwoLbl: UILabel!
    @IBOutlet weak var thumbnailMovieTwoImg: UIImageView!
    @IBOutlet weak var voteMovieTwoBackgroundView: UIView!
    @IBOutlet weak var voteMovieTwoLbl: UILabel!
    @IBOutlet weak var voteMovieThreeView: UIStackView!
    @IBOutlet weak var titleMovieThreeLbl: UILabel!
    @IBOutlet weak var thumbnailMovieThreeImg: UIImageView!
    @IBOutlet weak var voteMovieThreeBackgroundView: UIView!
    @IBOutlet weak var voteMovieThreeLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        [voteMovieOneBackgroundView, voteMovieTwoBackgroundView, voteMovieThreeBackgroundView].forEach({
            $0?.layer.borderColor = #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)
            $0?.layer.borderWidth = 1
            $0?.layer.cornerRadius = 8
        })
        
        let tapVoteOne = UITapGestureRecognizer(target: self, action: #selector(voteMovieOne(_:)))
        voteMovieOneView.isUserInteractionEnabled = true
        voteMovieOneView.addGestureRecognizer(tapVoteOne)
        
        let tapVoteTwo = UITapGestureRecognizer(target: self, action: #selector(voteMovieTwo(_:)))
        voteMovieTwoView.isUserInteractionEnabled = true
        voteMovieTwoView.addGestureRecognizer(tapVoteTwo)
        
        let tapVoteThree = UITapGestureRecognizer(target: self, action: #selector(voteMovieThree(_:)))
        voteMovieThreeView.isUserInteractionEnabled = true
        voteMovieThreeView.addGestureRecognizer(tapVoteThree)
    }
    
    // MARK: - Conversation Handling
    
    override func willBecomeActive(with conversation: MSConversation) {
        // Called when the extension is about to move from the inactive to active state.
        // This will happen when the extension is about to present UI.
        
        // Use this method to configure the extension and restore previously stored state.
        setupMovie(from: conversation, with: presentationStyle)
        print("Conversation: \(conversation)")
    }
    
    override func willTransition(to presentationStyle: MSMessagesAppPresentationStyle) {
        // Called before the extension transitions to a new presentation style.
    
        // Use this method to prepare for the change in presentation style.
    }
    
    override func didTransition(to presentationStyle: MSMessagesAppPresentationStyle) {
        // Called after the extension transitions to a new presentation style.
    
        // Use this method to finalize any behaviors associated with the change in presentation style.
        guard let conversation = activeConversation else { fatalError("Expected an active converstation") }
        setupMovie(from: conversation, with: presentationStyle)
    }
    
    private func setupMovie(from conversation: MSConversation, with presentationStyle: MSMessagesAppPresentationStyle) {
        let movie = BaseMovie(message: conversation.selectedMessage) ?? BaseMovie()
        voteMovieOneLbl.text = String(movie.votesMovieOne ?? 0)
        voteMovieTwoLbl.text = String(movie.votesMovieTwo ?? 0)
        voteMovieThreeLbl.text = String(movie.votesMovieThree ?? 0)
    }
    
    @objc func voteMovieOne(_ sender: UITapGestureRecognizer) {
        guard let conversation = activeConversation else { fatalError("Expected a conversation") }
                
        let voteMovieOne = Int(voteMovieOneLbl.text ?? "0") ?? 0
        let voteMovieTwo = Int(voteMovieTwoLbl.text ?? "0") ?? 0
        let voteMovieThree = Int(voteMovieThreeLbl.text ?? "0") ?? 0
        let message = composeMessage(with: .init(titleImage: "Movie 1", imageUrl: "", votesMovieOne: voteMovieOne+1, votesMovieTwo: voteMovieTwo, votesMovieThree: voteMovieThree), caption: "Vote Movie", session: conversation.selectedMessage?.session)
        
        conversation.insert(message)
        
        if presentationStyle == .expanded {
            dismiss()
        }
    }
    
    @objc func voteMovieTwo(_ sender: UITapGestureRecognizer) {
        guard let conversation = activeConversation else { fatalError("Expected a conversation") }
        
        let voteMovieOne = Int(voteMovieOneLbl.text ?? "0") ?? 0
        let voteMovieTwo = Int(voteMovieTwoLbl.text ?? "0") ?? 0
        let voteMovieThree = Int(voteMovieThreeLbl.text ?? "0") ?? 0
        let message = composeMessage(with: .init(titleImage: "Movie 2", imageUrl: "", votesMovieOne: voteMovieOne, votesMovieTwo: voteMovieTwo+1, votesMovieThree: voteMovieThree), caption: "Vote Movie", session: conversation.selectedMessage?.session)
        
        conversation.insert(message)
        
        if presentationStyle == .expanded {
            dismiss()
        }
    }
    
    @objc func voteMovieThree(_ sender: UITapGestureRecognizer) {
        guard let conversation = activeConversation else { fatalError("Expected a conversation") }
        
        let voteMovieOne = Int(voteMovieOneLbl.text ?? "0") ?? 0
        let voteMovieTwo = Int(voteMovieTwoLbl.text ?? "0") ?? 0
        let voteMovieThree = Int(voteMovieThreeLbl.text ?? "0") ?? 0
        let message = composeMessage(with: .init(titleImage: "Movie 3", imageUrl: "", votesMovieOne: voteMovieOne, votesMovieTwo: voteMovieTwo, votesMovieThree: voteMovieThree+1), caption: "Vote Movie", session: conversation.selectedMessage?.session)
        
        conversation.insert(message)
        
        if presentationStyle == .expanded {
            dismiss()
        }
    }
    
    /// - Tag: ComposeMessage
    fileprivate func composeMessage(with movie: BaseMovie, caption: String, session: MSSession? = nil) -> MSMessage {
        var components = URLComponents()
        components.queryItems = movie.queryItems
        
        let layout = MSMessageTemplateLayout()
//        layout.image = iceCream.renderSticker(opaque: true)
        layout.caption = caption
        
        let message = MSMessage(session: session ?? MSSession())
        message.url = components.url!
        message.layout = layout
        
        return message
    }
}

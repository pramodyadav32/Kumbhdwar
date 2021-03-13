//
//  User.swift
//
//  Created by Pawan Joshi on 21/02/17
//  Copyright (c) Appster. All rights reserved.
//

import Foundation
import SwiftyJSON

public enum UserType: Int {
    case salesRep = 2
    case technitian = 3
}

public enum BadgeIDType: String {
    case primaryType = "primary"
    case secondaryType = "secondary"
    case defaultType = "default"
}

public enum BadgeIDFont: String {
    case avenier = "Avenier LT Pro"
    case standard = "standard"
}

public final class User: NSObject, NSCoding {

    // MARK: Declaration for string constants to be used to decode and also serialize.
    private struct SerializationKeys {
        static let subscription = "subscription"
        static let industry = "industry"
        static let industryName = "industryName"
        static let bio = "bio"
        static let password = "password"
        static let uniqueId = "uniqueId"
        static let industryId = "industryId"
        static let companyName = "companyName"
        static let companyWebsite = "companyWebsite"
        static let jobTitle = "jobTitle"
        static let isNotificationEnabled = "isNotificationEnabled"
        static let type = "type"
        static let id = "id"
        static let image = "image"
        static let companyLogoImage = "companyLogo"
        static let companyYearStarted = "companyYearStarted"
        static let businessCardImage = "businessCard"
        static let address = "address"
        static let name = "name"
        static let firstName = "firstName"
        static let lastName = "lastName"
        static let email = "email"
        static let messageText = "messageText"
        static let createdAt = "createdAt"
        static let phoneNumber = "phoneNumber"
        static let status = "status"
        static let updatedAt = "updatedAt"
        static let socialProviders = "socialProviders"
        static let rating = "rating"
        static let subscriptionType = "subscriptionType"
        static let businessCardVideo = "businessCardVideo"
        static let videoUrl = "videoUrl"
        static let businessCardVideoFileURL = "businessCardVideoFileURL"
        static let company = "company"
        static let companyId = "companyId"
        static let recruitNotificationReminderDay = "recruitNotificationReminderDay"
        static let reviewCount = "reviewCount"
        static let recruiter = "recruiter"
        static let badgeIdType = "badgeIdType"
        static let verifyRepUrl = "verifyRepUrl"
        static let badgeIdFont = "badgeIdFont"
        static let secondaryLicenseNumber = "secondaryLicenseNumber"
        static let primaryLicenseNumber = "primaryLicenseNumber"
        static let secondaryCompanyLogo = "secondaryCompanyLogo"
        static let secondaryCompanyName = "secondaryCompanyName"
        static let displayVerifyRepUrl = "displayVerifyRepUrl"
    }

    // MARK: Properties
    public var displayVerifyRepUrl: String?
    public var badgeIdType: BadgeIDType?
    public var secondaryCompanyName: String?
    public var secondaryLicenseNumber: String?
    public var primaryLicenseNumber: String?
    public var secondaryCompanyLogo: String?
    public var verifyRepUrl: String?
    public var badgeIdFont: BadgeIDFont?
    public var industryName: String?
    public var bio: String?
    public var password: String?
    public var uniqueId: String?
    public var industryId: Int?
    public var recruitNotificationReminderDay: Int?
    public var companyName: String?
    public var companyWebsite: String?
    public var jobTitle: String?
    public var isNotificationEnabled: Int?
    public var isPasswordReset: Int?
    public var username: String?
    public var contactName: String?
    public var type: Int?
    public var cartCount: Int?
    public var id: Int?
    public var image: String?
    public var videoUrl: String?
    public var businessCardVideo: String?
    public var businessCardVideoFileURL: String?
    public var companyLogoImage: String?
    public var companyYearStarted: String?
    public var businessCardImage: String?
    public var firstName: String?
    public var name: String?
    public var lastName: String?
    public var email: String?
    public var createdAt: String?
    public var address: String?
    public var descriptionValue: String?
    public var followerCount: Int?
    public var phoneNumber: String?
    public var status: Int?
    public var isEmailVerified: Int?
    public var subscriptionType: Int?
    public var isMobileNumberVerified: Int?
    public var rating: Float?
    public var followingCount: Int?
    public var companyId: Int?
    public var fullName: String {
        return (firstName ?? "") + " " + (lastName ?? "")
    }

    public var userType: UserType {
        return type == 3 ? UserType.technitian : UserType.salesRep
    }
    
    public var updatedAt: String?
    public var message: String?
    public var messageText: String?
    public var reviewCount: Int?

    public override init() {
        super.init()
    }

    // MARK: SwiftyJSON Initializers
    /// Initiates the instance based on the object.
    ///
    /// - parameter object: The object of either Dictionary or Array kind that was passed.
    /// - returns: An initialized instance of the class.
    public convenience init(object: Any) {
        self.init(json: JSON(object))
    }

    /// Initiates the instance based on the JSON that was passed.
    ///
    /// - parameter json: JSON object from SwiftyJSON.
    public required init(json: JSON) {
        isNotificationEnabled = json[SerializationKeys.isNotificationEnabled].int
        type = json[SerializationKeys.type].int
        subscriptionType = json[SerializationKeys.subscriptionType].int
        if let industry = json[SerializationKeys.industry].dictionaryObject {
            industryId = industry["id"] as? Int
            industryName = industry["name"] as? String
        }
        if let company = json[SerializationKeys.company].dictionaryObject {
            industryId = company["industryId"] as? Int
            industryName = company["industryName"] as? String
        }
        id = json[SerializationKeys.id].int
        image = json[SerializationKeys.image].string
        password = json[SerializationKeys.password].string
        bio = json[SerializationKeys.bio].string
        uniqueId = json[SerializationKeys.uniqueId].string
        businessCardVideo = json[SerializationKeys.businessCardVideo].string
        videoUrl = json[SerializationKeys.videoUrl].string
        businessCardVideoFileURL = json[SerializationKeys.businessCardVideoFileURL].string
        address = json[SerializationKeys.address].string
        companyLogoImage = json[SerializationKeys.companyLogoImage].string
        companyYearStarted = json[SerializationKeys.companyYearStarted].string
        businessCardImage = json[SerializationKeys.businessCardImage].string
        companyName = json[SerializationKeys.companyName].string
        companyWebsite = json[SerializationKeys.companyWebsite].string
        jobTitle = json[SerializationKeys.jobTitle].string
        name = json[SerializationKeys.name].string
        firstName = json[SerializationKeys.firstName].string
        lastName = json[SerializationKeys.lastName].string
        email = json[SerializationKeys.email].string
        messageText = json[SerializationKeys.messageText].string
        createdAt = json[SerializationKeys.createdAt].string
        phoneNumber = json[SerializationKeys.phoneNumber].string
        rating = json[SerializationKeys.rating].float
        updatedAt = json[SerializationKeys.updatedAt].string
        status = json[SerializationKeys.status].int
        companyId = json[SerializationKeys.companyId].int
        recruitNotificationReminderDay = json[SerializationKeys.recruitNotificationReminderDay].int
        reviewCount = json[SerializationKeys.reviewCount].int
        badgeIdFont = BadgeIDFont(rawValue: json[SerializationKeys.badgeIdFont].string ?? "standard") ?? .standard
        badgeIdType = BadgeIDType(rawValue: json[SerializationKeys.badgeIdType].string ?? "default") ?? .defaultType
        verifyRepUrl = json[SerializationKeys.verifyRepUrl].string
        primaryLicenseNumber = json[SerializationKeys.primaryLicenseNumber].string
        secondaryLicenseNumber = json[SerializationKeys.secondaryLicenseNumber].string
        secondaryCompanyLogo = json[SerializationKeys.secondaryCompanyLogo].string
        secondaryCompanyName = json[SerializationKeys.secondaryCompanyName].string
        displayVerifyRepUrl = json[SerializationKeys.displayVerifyRepUrl].string
    }

    /// Generates description of the object in the form of a NSDictionary.
    ///
    /// - returns: A Key value pair containing all valid values in the object.
    public func dictionaryRepresentation() -> [String: Any] {
        var dictionary: [String: Any] = [String: Any]()
        if let value = isNotificationEnabled {
            dictionary[SerializationKeys.isNotificationEnabled] = value
        }
        if let value = subscriptionType { dictionary[SerializationKeys.subscriptionType] = value }
        if let value = type { dictionary[SerializationKeys.type] = value }
        if let value = uniqueId { dictionary[SerializationKeys.uniqueId] = value }
        if let value = industryId { dictionary[SerializationKeys.industryId] = value }
        if let value = image { dictionary[SerializationKeys.image] = value }
        if let value = companyId { dictionary[SerializationKeys.companyId] = value }
        if let value = recruitNotificationReminderDay { dictionary[SerializationKeys.recruitNotificationReminderDay] = value }
        if let value = bio { dictionary[SerializationKeys.bio] = value }
        if let value = password { dictionary[SerializationKeys.password] = value }
        if let value = messageText { dictionary[SerializationKeys.messageText] = value }
        if let value = businessCardVideo { dictionary[SerializationKeys.businessCardVideo] = value }
        if let value = videoUrl { dictionary[SerializationKeys.videoUrl] = value }
        if let value = businessCardVideoFileURL { dictionary[SerializationKeys.businessCardVideoFileURL] = value }
        if let value = address { dictionary[SerializationKeys.address] = value }
        if let value = companyLogoImage { dictionary[SerializationKeys.companyLogoImage] = value }
        if let value = companyYearStarted { dictionary[SerializationKeys.companyYearStarted] = value }
        if let value = businessCardImage { dictionary[SerializationKeys.businessCardImage] = value }
        if let value = industryName { dictionary[SerializationKeys.industryName] = value }
        if let value = companyName { dictionary[SerializationKeys.companyName] = value }
        if let value = companyWebsite { dictionary[SerializationKeys.companyWebsite] = value }
        if let value = jobTitle { dictionary[SerializationKeys.jobTitle] = value }
        if let value = name { dictionary[SerializationKeys.name] = value }
        if let value = firstName { dictionary[SerializationKeys.firstName] = value }
        if let value = lastName { dictionary[SerializationKeys.lastName] = value }
        if let value = email { dictionary[SerializationKeys.email] = value }
        if let value = rating { dictionary[SerializationKeys.rating] = value }
        if let value = createdAt { dictionary[SerializationKeys.createdAt] = value }
        if let value = phoneNumber { dictionary[SerializationKeys.phoneNumber] = value }
        if let value = status { dictionary[SerializationKeys.status] = value }
        if let value = updatedAt { dictionary[SerializationKeys.updatedAt] = value }
        if let value = reviewCount { dictionary[SerializationKeys.reviewCount] = value }
        if let value = badgeIdType { dictionary[SerializationKeys.badgeIdType] = value.rawValue }
        if let value = badgeIdFont { dictionary[SerializationKeys.badgeIdFont] = value.rawValue }
        if let value = verifyRepUrl { dictionary[SerializationKeys.verifyRepUrl] = value }
        if let value = primaryLicenseNumber { dictionary[SerializationKeys.primaryLicenseNumber] = value }
        if let value = secondaryLicenseNumber { dictionary[SerializationKeys.secondaryLicenseNumber] = value }
        if let value = secondaryCompanyLogo { dictionary[SerializationKeys.secondaryCompanyLogo] = value }
        if let value = secondaryCompanyName { dictionary[SerializationKeys.secondaryCompanyName] = value }
        if let value = displayVerifyRepUrl { dictionary[SerializationKeys.displayVerifyRepUrl] = value }
        return dictionary
    }

    // MARK: NSCoding Protocol
    public required init(coder aDecoder: NSCoder) {
        isNotificationEnabled = aDecoder.decodeObject(forKey: SerializationKeys.isNotificationEnabled) as? Int
        type = aDecoder.decodeObject(forKey: SerializationKeys.type) as? Int
        companyId = aDecoder.decodeObject(forKey: SerializationKeys.companyId) as? Int
        subscriptionType = aDecoder.decodeObject(forKey: SerializationKeys.subscriptionType) as? Int
        id = aDecoder.decodeObject(forKey: SerializationKeys.id) as? Int
        industryId = aDecoder.decodeObject(forKey: SerializationKeys.industryId) as? Int
        image = aDecoder.decodeObject(forKey: SerializationKeys.image) as? String
        bio = aDecoder.decodeObject(forKey: SerializationKeys.bio) as? String
        password = aDecoder.decodeObject(forKey: SerializationKeys.password) as? String
        uniqueId = aDecoder.decodeObject(forKey: SerializationKeys.uniqueId) as? String
        businessCardVideoFileURL = aDecoder.decodeObject(forKey: SerializationKeys.businessCardVideoFileURL) as? String
        videoUrl = aDecoder.decodeObject(forKey: SerializationKeys.videoUrl) as? String
        businessCardVideo = aDecoder.decodeObject(forKey: SerializationKeys.businessCardVideo) as? String
        address = aDecoder.decodeObject(forKey: SerializationKeys.address) as? String
        companyLogoImage = aDecoder.decodeObject(forKey: SerializationKeys.companyLogoImage) as? String
        companyYearStarted = aDecoder.decodeObject(forKey: SerializationKeys.companyYearStarted) as? String
        businessCardImage = aDecoder.decodeObject(forKey: SerializationKeys.businessCardImage) as? String
        industryName = aDecoder.decodeObject(forKey: SerializationKeys.industryName) as? String
        companyName = aDecoder.decodeObject(forKey: SerializationKeys.companyName) as? String
        jobTitle = aDecoder.decodeObject(forKey: SerializationKeys.jobTitle) as? String
        companyWebsite = aDecoder.decodeObject(forKey: SerializationKeys.companyWebsite) as? String
        rating = aDecoder.decodeObject(forKey: SerializationKeys.rating) as? Float
        firstName = aDecoder.decodeObject(forKey: SerializationKeys.firstName) as? String
        lastName = aDecoder.decodeObject(forKey: SerializationKeys.lastName) as? String
        name = aDecoder.decodeObject(forKey: SerializationKeys.name) as? String
        email = aDecoder.decodeObject(forKey: SerializationKeys.email) as? String
        messageText = aDecoder.decodeObject(forKey: SerializationKeys.messageText) as? String
        createdAt = aDecoder.decodeObject(forKey: SerializationKeys.createdAt) as? String
        phoneNumber = aDecoder.decodeObject(forKey: SerializationKeys.phoneNumber) as? String
        status = aDecoder.decodeObject(forKey: SerializationKeys.status) as? Int
        recruitNotificationReminderDay = aDecoder.decodeObject(forKey: SerializationKeys.recruitNotificationReminderDay) as? Int
        updatedAt = aDecoder.decodeObject(forKey: SerializationKeys.updatedAt) as? String
        reviewCount = aDecoder.decodeObject(forKey: SerializationKeys.reviewCount) as? Int
        if let typeValue = aDecoder.decodeObject(forKey: SerializationKeys.badgeIdType) as? String {
            badgeIdType = BadgeIDType(rawValue: typeValue) ?? .defaultType
        } else {
            badgeIdType = .defaultType
        }
        
        if let fontValue = aDecoder.decodeObject(forKey: SerializationKeys.badgeIdFont) as? String {
            badgeIdFont = BadgeIDFont(rawValue: fontValue) ?? .standard
        } else {
            badgeIdFont = .standard
        }
        verifyRepUrl = aDecoder.decodeObject(forKey: SerializationKeys.verifyRepUrl) as? String
        secondaryCompanyLogo = aDecoder.decodeObject(forKey: SerializationKeys.secondaryCompanyLogo) as? String
        secondaryCompanyName = aDecoder.decodeObject(forKey: SerializationKeys.secondaryCompanyName) as? String
        primaryLicenseNumber = aDecoder.decodeObject(forKey: SerializationKeys.primaryLicenseNumber) as? String
        secondaryLicenseNumber = aDecoder.decodeObject(forKey: SerializationKeys.secondaryLicenseNumber) as? String
        displayVerifyRepUrl = aDecoder.decodeObject(forKey: SerializationKeys.displayVerifyRepUrl) as? String
    }

    public func encode(with aCoder: NSCoder) {
        aCoder.encode(isNotificationEnabled, forKey: SerializationKeys.isNotificationEnabled)
        aCoder.encode(type, forKey: SerializationKeys.type)
        aCoder.encode(companyId, forKey: SerializationKeys.companyId)
        aCoder.encode(subscriptionType, forKey: SerializationKeys.subscriptionType)
        aCoder.encode(id, forKey: SerializationKeys.id)
        aCoder.encode(recruitNotificationReminderDay, forKey: SerializationKeys.recruitNotificationReminderDay)
        aCoder.encode(industryId, forKey: SerializationKeys.industryId)
        aCoder.encode(image, forKey: SerializationKeys.image)
        aCoder.encode(bio, forKey: SerializationKeys.bio)
        aCoder.encode(password, forKey: SerializationKeys.password)
        aCoder.encode(uniqueId, forKey: SerializationKeys.uniqueId)
        aCoder.encode(businessCardVideoFileURL, forKey: SerializationKeys.businessCardVideoFileURL)
        aCoder.encode(videoUrl, forKey: SerializationKeys.videoUrl)
        aCoder.encode(businessCardVideo, forKey: SerializationKeys.businessCardVideo)
        aCoder.encode(businessCardImage, forKey: SerializationKeys.businessCardImage)
        aCoder.encode(address, forKey: SerializationKeys.address)
        aCoder.encode(industryName, forKey: SerializationKeys.industryName)
        aCoder.encode(companyName, forKey: SerializationKeys.companyName)
        aCoder.encode(companyLogoImage, forKey: SerializationKeys.companyLogoImage)
        aCoder.encode(companyYearStarted, forKey: SerializationKeys.companyYearStarted)
        aCoder.encode(jobTitle, forKey: SerializationKeys.jobTitle)
        aCoder.encode(companyWebsite, forKey: SerializationKeys.companyWebsite)
        aCoder.encode(rating, forKey: SerializationKeys.rating)
        aCoder.encode(name, forKey: SerializationKeys.name)
        aCoder.encode(firstName, forKey: SerializationKeys.firstName)
        aCoder.encode(lastName, forKey: SerializationKeys.lastName)
        aCoder.encode(email, forKey: SerializationKeys.email)
        aCoder.encode(messageText, forKey: SerializationKeys.messageText)
        aCoder.encode(createdAt, forKey: SerializationKeys.createdAt)
        aCoder.encode(phoneNumber, forKey: SerializationKeys.phoneNumber)
        aCoder.encode(status, forKey: SerializationKeys.status)
        aCoder.encode(updatedAt, forKey: SerializationKeys.updatedAt)
        aCoder.encode(reviewCount, forKey: SerializationKeys.reviewCount)
        aCoder.encode(badgeIdType?.rawValue ?? "default", forKey: SerializationKeys.badgeIdType)
        aCoder.encode(badgeIdFont?.rawValue ?? "standard", forKey: SerializationKeys.badgeIdFont)
        aCoder.encode(verifyRepUrl, forKey: SerializationKeys.verifyRepUrl)
        aCoder.encode(secondaryCompanyLogo, forKey: SerializationKeys.secondaryCompanyLogo)
        aCoder.encode(primaryLicenseNumber, forKey: SerializationKeys.primaryLicenseNumber)
        aCoder.encode(secondaryLicenseNumber, forKey: SerializationKeys.secondaryLicenseNumber)
        aCoder.encode(secondaryCompanyName, forKey: SerializationKeys.secondaryCompanyName)
        aCoder.encode(displayVerifyRepUrl, forKey: SerializationKeys.displayVerifyRepUrl)
    }
}

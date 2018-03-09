/* 
Copyright (c) 2018 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
open class WCOrder : Codable , WPAPI {
    
    // Slug for end point
    open class var endpoint: String {
        return "orders"
    }
    
	let id : Int?
	let parentId : Int?
	let number : Int?
	let orderKey : String?
	let createdVia : String?
	let version : String?
	let status : String?
	let currency : String?
	let dateCreated : Date?
	let dateCreatedGmt : Date?
	let dateModified : Date?
	let dateModifiedGmt : Date?
	let discountTotal : Double?
	let discountTax : Double?
	let shippingTotal : Double?
	let shippingTax : Double?
	let cartTax : Double?
	let total : Double?
	let totalTax : Double?
	let pricesIncludeTax : Bool?
	let customerId : Int?
	let customerIpAddress : String?
	let customerUserAgent : String?
	let customerNote : String?
	let billing : Address?
	let shipping : Address?
	let paymentMethod : String?
	let paymentMethodTitle : String?
	let transactionId : String?
	let datePaid : Date?
	let datePaidGmt : Date?
	let dateCompleted : Date?
	let dateCompletedGmt : Date?
	let cartHash : String?
	let metaData : [MetaData]?
	let lineItems : [LineItem]?
	let taxLines : [TaxLine]?
	let shippingLines : [String]?
	let feeLines : [String]?
	let couponLines : [String]?
	let refunds : [String]?

    public init(currency: String?, billing: Address?, shipping: Address?, lineItems: [LineItem]?) {
        self.id  = nil
        self.parentId  = nil
        self.number  = nil
        self.orderKey  = nil
        self.createdVia  = nil
        self.version  = nil
        self.status  = nil
        self.currency  = currency
        self.dateCreated  = nil
        self.dateCreatedGmt  = nil
        self.dateModified  = nil
        self.dateModifiedGmt  = nil
        self.discountTotal  = nil
        self.discountTax  = nil
        self.shippingTotal  = nil
        self.shippingTax  = nil
        self.cartTax  = nil
        self.total  = nil
        self.totalTax  = nil
        self.pricesIncludeTax  = nil
        self.customerId  = nil
        self.customerIpAddress  = nil
        self.customerUserAgent  = nil
        self.customerNote  = nil
        self.billing  = billing
        self.shipping  = shipping
        self.paymentMethod  = nil
        self.paymentMethodTitle  = nil
        self.transactionId  = nil
        self.datePaid  = nil
        self.datePaidGmt  = nil
        self.dateCompleted  = nil
        self.dateCompletedGmt  = nil
        self.cartHash  = nil
        self.metaData  = nil
        self.lineItems  = lineItems
        self.taxLines  = nil
        self.shippingLines  = nil
        self.feeLines  = nil
        self.couponLines  = nil
        self.refunds  = nil
    }

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case parent_id = "parent_id"
		case number = "number"
		case order_key = "order_key"
		case created_via = "created_via"
		case version = "version"
		case status = "status"
		case currency = "currency"
		case date_created = "date_created"
		case date_created_gmt = "date_created_gmt"
		case date_modified = "date_modified"
		case date_modified_gmt = "date_modified_gmt"
		case discount_total = "discount_total"
		case discount_tax = "discount_tax"
		case shipping_total = "shipping_total"
		case shipping_tax = "shipping_tax"
		case cart_tax = "cart_tax"
		case total = "total"
		case total_tax = "total_tax"
		case prices_include_tax = "prices_include_tax"
		case customer_id = "customer_id"
		case customer_ip_address = "customer_ip_address"
		case customer_user_agent = "customer_user_agent"
		case customer_note = "customer_note"
		case billing = "billing"
		case shipping = "shipping"
		case payment_method = "payment_method"
		case payment_method_title = "payment_method_title"
		case transaction_id = "transaction_id"
		case date_paid = "date_paid"
		case date_paid_gmt = "date_paid_gmt"
		case date_completed = "date_completed"
		case date_completed_gmt = "date_completed_gmt"
		case cart_hash = "cart_hash"
		case meta_data = "meta_data"
		case line_items = "line_items"
		case tax_lines = "tax_lines"
		case shipping_lines = "shipping_lines"
		case fee_lines = "fee_lines"
		case coupon_lines = "coupon_lines"
		case refunds = "refunds"
	}

    public required init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		parentId = try values.decodeIfPresent(Int.self, forKey: .parent_id)
		number = try values.decodeIfPresent(Int.self, forKey: .number)
		orderKey = try values.decodeIfPresent(String.self, forKey: .order_key)
		createdVia = try values.decodeIfPresent(String.self, forKey: .created_via)
		version = try values.decodeIfPresent(String.self, forKey: .version)
		status = try values.decodeIfPresent(String.self, forKey: .status)
		currency = try values.decodeIfPresent(String.self, forKey: .currency)
        dateCreated = WP.dateFormatter.date(from: try values.decodeIfPresent(String.self, forKey: .date_created)!)
        dateCreatedGmt = WP.dateFormatter.date(from: try values.decodeIfPresent(String.self, forKey: .date_created_gmt)!)
        dateModified = WP.dateFormatter.date(from: try values.decodeIfPresent(String.self, forKey: .date_modified)!)
        dateModifiedGmt = WP.dateFormatter.date(from: try values.decodeIfPresent(String.self, forKey: .date_modified_gmt)!)
		discountTotal = try values.decodeIfPresent(Double.self, forKey: .discount_total)
		discountTax = try values.decodeIfPresent(Double.self, forKey: .discount_tax)
		shippingTotal = try values.decodeIfPresent(Double.self, forKey: .shipping_total)
		shippingTax = try values.decodeIfPresent(Double.self, forKey: .shipping_tax)
		cartTax = try values.decodeIfPresent(Double.self, forKey: .cart_tax)
		total = try values.decodeIfPresent(Double.self, forKey: .total)
		totalTax = try values.decodeIfPresent(Double.self, forKey: .total_tax)
		pricesIncludeTax = try values.decodeIfPresent(Bool.self, forKey: .prices_include_tax)
		customerId = try values.decodeIfPresent(Int.self, forKey: .customer_id)
		customerIpAddress = try values.decodeIfPresent(String.self, forKey: .customer_ip_address)
        customerUserAgent = try values.decodeIfPresent(String.self, forKey: .customer_user_agent)
        customerNote = try values.decodeIfPresent(String.self, forKey: .customer_note)
        billing = try values.decodeIfPresent(Address.self, forKey: .billing)
        shipping = try values.decodeIfPresent(Address.self, forKey: .shipping)
		paymentMethod = try values.decodeIfPresent(String.self, forKey: .payment_method)
		paymentMethodTitle = try values.decodeIfPresent(String.self, forKey: .payment_method_title)
		transactionId = try values.decodeIfPresent(String.self, forKey: .transaction_id)
        datePaid = WP.dateFormatter.date(from: try values.decodeIfPresent(String.self, forKey: .date_paid)!)
        datePaidGmt = WP.dateFormatter.date(from: try values.decodeIfPresent(String.self, forKey: .date_paid_gmt)!)
        dateCompleted = WP.dateFormatter.date(from: try values.decodeIfPresent(String.self, forKey: .date_completed)!)
        dateCompletedGmt = WP.dateFormatter.date(from: try values.decodeIfPresent(String.self, forKey: .date_completed_gmt)!)
		cartHash = try values.decodeIfPresent(String.self, forKey: .cart_hash)
		metaData = try values.decodeIfPresent([MetaData].self, forKey: .meta_data)
		lineItems = try values.decodeIfPresent([LineItem].self, forKey: .line_items)
		taxLines = try values.decodeIfPresent([TaxLine].self, forKey: .tax_lines)
		shippingLines = try values.decodeIfPresent([String].self, forKey: .shipping_lines)
		feeLines = try values.decodeIfPresent([String].self, forKey: .fee_lines)
		couponLines = try values.decodeIfPresent([String].self, forKey: .coupon_lines)
		refunds = try values.decodeIfPresent([String].self, forKey: .refunds)
	}
    
    public func encode(to encoder: Encoder) throws {
        
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encodeIfPresent(id, forKey: .id)
        try container.encodeIfPresent(parentId, forKey: .parent_id)
        try container.encodeIfPresent(number, forKey: .number)
        try container.encodeIfPresent(orderKey, forKey: .order_key)
        try container.encodeIfPresent(createdVia, forKey: .created_via)
        try container.encodeIfPresent(version, forKey: .version)
        try container.encodeIfPresent(status, forKey: .status)
        try container.encodeIfPresent(currency, forKey: .currency)
        try container.encodeIfPresent(WP.dateFormatter.string(from: dateCreated ?? Date()), forKey: .date_created)
        try container.encodeIfPresent(WP.dateFormatter.string(from: dateCreatedGmt ?? Date()), forKey: .date_created_gmt)
        try container.encodeIfPresent(WP.dateFormatter.string(from: dateModified ?? Date()), forKey: .date_modified)
        try container.encodeIfPresent(WP.dateFormatter.string(from: dateModifiedGmt ?? Date()), forKey: .date_modified_gmt)
        try container.encodeIfPresent(discountTotal, forKey: .discount_total)
        try container.encodeIfPresent(discountTax, forKey: .discount_tax)
        try container.encodeIfPresent(shippingTotal, forKey: .shipping_total)
        try container.encodeIfPresent(shippingTax, forKey: .shipping_tax)
        try container.encodeIfPresent(cartTax, forKey: .cart_tax)
        try container.encodeIfPresent(total, forKey: .total)
        try container.encodeIfPresent(totalTax, forKey: .total_tax)
        try container.encodeIfPresent(pricesIncludeTax, forKey: .prices_include_tax)
        try container.encodeIfPresent(customerId, forKey: .customer_id)
        try container.encodeIfPresent(customerIpAddress, forKey: .customer_ip_address)
        try container.encodeIfPresent(customerUserAgent, forKey: .customer_user_agent)
        try container.encodeIfPresent(billing, forKey: .billing)
        try container.encodeIfPresent(shipping, forKey: .shipping)
        try container.encodeIfPresent(paymentMethod, forKey: .payment_method)
        try container.encodeIfPresent(paymentMethodTitle, forKey: .payment_method_title)
        try container.encodeIfPresent(transactionId, forKey: .transaction_id)
        try container.encodeIfPresent(WP.dateFormatter.string(from: datePaid ?? Date()), forKey: .date_paid)
        try container.encodeIfPresent(WP.dateFormatter.string(from: datePaidGmt ?? Date()), forKey: .date_paid_gmt)
        try container.encodeIfPresent(WP.dateFormatter.string(from: dateCompleted ?? Date()), forKey: .date_completed)
        try container.encodeIfPresent(WP.dateFormatter.string(from: dateCreatedGmt ?? Date()), forKey: .date_completed_gmt)
        try container.encodeIfPresent(cartHash, forKey: .cart_hash)
        try container.encodeIfPresent(metaData, forKey: .meta_data)
        try container.encodeIfPresent(lineItems, forKey: .line_items)
        try container.encodeIfPresent(taxLines, forKey: .tax_lines)
        try container.encodeIfPresent(shippingLines, forKey: .shipping_lines)
        try container.encodeIfPresent(feeLines, forKey: .fee_lines)
        try container.encodeIfPresent(couponLines, forKey: .coupon_lines)
        try container.encodeIfPresent(refunds, forKey: .refunds)
    }
    
    public struct MetaData : Codable {
        let id : Int?
        let key : String?
        let value : String?
        
        enum CodingKeys: String, CodingKey {
            
            case id = "id"
            case key = "key"
            case value = "value"
        }
        
        public init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            id = try values.decodeIfPresent(Int.self, forKey: .id)
            key = try values.decodeIfPresent(String.self, forKey: .key)
            value = try values.decodeIfPresent(String.self, forKey: .value)
        }
        
    }
    
    public struct Address : Codable {
        let firstName : String?
        let lastName : String?
        let company : String?
        let address1 : String?
        let address2 : String?
        let city : String?
        let state : String?
        let postcode : String?
        let country : String?
        
        enum CodingKeys: String, CodingKey {
            
            case first_name = "first_name"
            case last_name = "last_name"
            case company = "company"
            case address_1 = "address_1"
            case address_2 = "address_2"
            case city = "city"
            case state = "state"
            case postcode = "postcode"
            case country = "country"
        }
        
        public init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            firstName = try values.decodeIfPresent(String.self, forKey: .first_name)
            lastName = try values.decodeIfPresent(String.self, forKey: .last_name)
            company = try values.decodeIfPresent(String.self, forKey: .company)
            address1 = try values.decodeIfPresent(String.self, forKey: .address_1)
            address2 = try values.decodeIfPresent(String.self, forKey: .address_2)
            city = try values.decodeIfPresent(String.self, forKey: .city)
            state = try values.decodeIfPresent(String.self, forKey: .state)
            postcode = try values.decodeIfPresent(String.self, forKey: .postcode)
            country = try values.decodeIfPresent(String.self, forKey: .country)
        }
        
        public func encode(to encoder: Encoder) throws {
            
            var container = encoder.container(keyedBy: CodingKeys.self)
            
            try container.encodeIfPresent(firstName, forKey: .first_name)
            try container.encodeIfPresent(lastName, forKey: .last_name)
            try container.encodeIfPresent(company, forKey: .company)
            try container.encodeIfPresent(address1, forKey: .address_1)
            try container.encodeIfPresent(address2, forKey: .address_2)
            try container.encodeIfPresent(city, forKey: .city)
            try container.encodeIfPresent(state, forKey: .state)
            try container.encodeIfPresent(postcode, forKey: .postcode)
            try container.encodeIfPresent(country, forKey: .country)
        }
        
    }
    
    public struct LineItem : Codable {
        let id : Int?
        let name : String?
        let productId : Int?
        let variationId : Int?
        let quantity : Int?
        let taxClass : String?
        let subtotal : Double?
        let subtotalTax : Double?
        let total : Double?
        let totalTax : Double?
        let taxes : [Tax]?
        let metaData : [String]?
        let sku : String?
        let price : Double?
        
        enum CodingKeys: String, CodingKey {
            
            case id = "id"
            case name = "name"
            case product_id = "product_id"
            case variation_id = "variation_id"
            case quantity = "quantity"
            case tax_class = "tax_class"
            case subtotal = "subtotal"
            case subtotal_tax = "subtotal_tax"
            case total = "total"
            case total_tax = "total_tax"
            case taxes = "taxes"
            case meta_data = "meta_data"
            case sku = "sku"
            case price = "price"
        }
        
        public init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            id = try values.decodeIfPresent(Int.self, forKey: .id)
            name = try values.decodeIfPresent(String.self, forKey: .name)
            productId = try values.decodeIfPresent(Int.self, forKey: .product_id)
            variationId = try values.decodeIfPresent(Int.self, forKey: .variation_id)
            quantity = try values.decodeIfPresent(Int.self, forKey: .quantity)
            taxClass = try values.decodeIfPresent(String.self, forKey: .tax_class)
            subtotal = try values.decodeIfPresent(Double.self, forKey: .subtotal)
            subtotalTax = try values.decodeIfPresent(Double.self, forKey: .subtotal_tax)
            total = try values.decodeIfPresent(Double.self, forKey: .total)
            totalTax = try values.decodeIfPresent(Double.self, forKey: .total_tax)
            taxes = try values.decodeIfPresent([Tax].self, forKey: .taxes)
            metaData = try values.decodeIfPresent([String].self, forKey: .meta_data)
            sku = try values.decodeIfPresent(String.self, forKey: .sku)
            price = try values.decodeIfPresent(Double.self, forKey: .price)
        }
        
        public func encode(to encoder: Encoder) throws {
            
            var container = encoder.container(keyedBy: CodingKeys.self)
            
            try container.encodeIfPresent(id, forKey: .id)
            try container.encodeIfPresent(name, forKey: .name)
            try container.encodeIfPresent(productId, forKey: .product_id)
            try container.encodeIfPresent(variationId, forKey: .variation_id)
            try container.encodeIfPresent(quantity, forKey: .quantity)
            try container.encodeIfPresent(taxClass, forKey: .tax_class)
            try container.encodeIfPresent(subtotal, forKey: .subtotal)
            try container.encodeIfPresent(subtotalTax, forKey: .subtotal_tax)
            try container.encodeIfPresent(total, forKey: .total)
            try container.encodeIfPresent(totalTax, forKey: .total_tax)
            try container.encodeIfPresent(taxes, forKey: .taxes)
            try container.encodeIfPresent(metaData, forKey: .meta_data)
            try container.encodeIfPresent(sku, forKey: .sku)
            try container.encodeIfPresent(price, forKey: .price)
            
        }
        
        struct Tax : Codable {
            let id : Int?
            let total : Double?
            let subtotal : Double?
            
            enum CodingKeys: String, CodingKey {
                
                case id = "id"
                case total = "total"
                case subtotal = "subtotal"
            }
            
            init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
                id = try values.decodeIfPresent(Int.self, forKey: .id)
                total = try values.decodeIfPresent(Double.self, forKey: .total)
                subtotal = try values.decodeIfPresent(Double.self, forKey: .subtotal)
            }
            
        }
        
    }
    
    public struct TaxLine : Codable {
        let id : Int?
        let rateCode : String?
        let rateId : Int?
        let label : String?
        let compound : Bool?
        let taxTotal : Double?
        let shippingTaxTotal : Double?
        let metaData : [String]?
        
        enum CodingKeys: String, CodingKey {
            
            case id = "id"
            case rate_code = "rate_code"
            case rate_id = "rate_id"
            case label = "label"
            case compound = "compound"
            case tax_total = "tax_total"
            case shipping_tax_total = "shipping_tax_total"
            case meta_data = "meta_data"
        }
        
        public init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            id = try values.decodeIfPresent(Int.self, forKey: .id)
            rateCode = try values.decodeIfPresent(String.self, forKey: .rate_code)
            rateId = try values.decodeIfPresent(Int.self, forKey: .rate_id)
            label = try values.decodeIfPresent(String.self, forKey: .label)
            compound = try values.decodeIfPresent(Bool.self, forKey: .compound)
            taxTotal = try values.decodeIfPresent(Double.self, forKey: .tax_total)
            shippingTaxTotal = try values.decodeIfPresent(Double.self, forKey: .shipping_tax_total)
            metaData = try values.decodeIfPresent([String].self, forKey: .meta_data)
        }
        
        public func encode(to encoder: Encoder) throws {
            
            var container = encoder.container(keyedBy: CodingKeys.self)
            
            try container.encodeIfPresent(id, forKey: .id)
            try container.encodeIfPresent(rateCode, forKey: .rate_code)
            try container.encodeIfPresent(rateId, forKey: .rate_id)
            try container.encodeIfPresent(label, forKey: .label)
            try container.encodeIfPresent(compound, forKey: .compound)
            try container.encodeIfPresent(taxTotal, forKey: .tax_total)
            try container.encodeIfPresent(shippingTaxTotal, forKey: .shipping_tax_total)
            try container.encodeIfPresent(metaData, forKey: .meta_data)
            
        }
        
    }

}

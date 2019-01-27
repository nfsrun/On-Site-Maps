//client already implements console code

//table references
let table1 = client.tableWithName("Object")
let table2 = client.tableWithName("ObjectType")
let table3 = client.tableWithName("LocationType")

//sample dictionaries
let newItem1 = ["id": "custom-id", "text": "my new item", "complete": false]
let newItem2 = ["id": "custom-id", "text": "my new item", "complete": false]
let newItem3 = ["id": "custom-id", "text": "my new item", "complete": false]

table1.insert(newItem1) { (result, error) in
    if let err = error {
        print("ERROR ", err)
    } else if let item = result {
        print("Todo Item: ", item["text"])
    }
}

table2.insert(newItem2) { (result, error) in
    if let err = error {
        print("ERROR ", err)
    } else if let item = result {
        print("Todo Item: ", item["text"])
    }
}

table3.insert(newItem3) { (result, error) in
    if let err = error {
        print("ERROR ", err)
    } else if let item = result {
        print("Todo Item: ", item["text"])
    }
}
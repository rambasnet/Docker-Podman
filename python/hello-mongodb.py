from pymongo import MongoClient

def get_database():
   # find the IP address of the mongodb container
   # podman inspect  my_mongodb | grep IPAddress
   # Provide the mongodb atlas url to connect python to mongodb using pymongo
   # not using authentication for local containers
   CONNECTION_STRING = "mongodb://172.17.0.3:27017/myFirstDatabase"
 
   # Create a connection using MongoClient. You can import MongoClient or use pymongo.MongoClient
   client = MongoClient(CONNECTION_STRING)
 
   # Create the database for our example (we will use the same database throughout the tutorial
   return client['user_shopping_list']
  
def create_collection():
  dbname = get_database()
  collection_name = dbname["user_1_items"]
  item_1 = {
    "_id" : "U1IT00001",
    "item_name" : "Blender",
    "max_discount" : "10%",
    "batch_number" : "RR450020FRG",
    "price" : 340,
    "category" : "kitchen appliance"
  }

  item_2 = {
    "_id" : "U1IT00002",
    "item_name" : "Egg",
    "category" : "food",
    "quantity" : 12,
    "price" : 36,
    "item_description" : "brown country eggs"
  }
  collection_name.insert_many([item_1, item_2])

def query_mongodb():
  # Get the database using the method we defined in pymongo_test_insert file
  dbname = get_database()
  
  # Retrieve a collection named "user_1_items" from database
  collection_name = dbname["user_1_items"]
  
  item_details = collection_name.find()
  for item in item_details:
    # This does not give a very readable output
    print(item)

if __name__ == "__main__":   
  create_collection()
  dbname = get_database()
  print(dbname.list_collection_names())
  query_mongodb()


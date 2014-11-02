user = User.create(username: "123", password: "123")
package = Package.create(api: "Yo", auth_key: "b33f9516-2d7e-4874-b214-3f5ec8fb59d0")
request1 = Request.create(type: "post", name: "yo", url: "https://api.justyo.co/yo/", doc: "send a yo")
request2 = Request.create(type: "post", name: "yoall", url: "https://api.justyo.co/yoall/", doc: "send a yo to everyone in your contact list")

user.packages << package
package.requests << request1
package.requests << request2


// Add our dependancies
var expect = require('chai').expect;
var supertest = require('supertest')
var api = supertest('http://localhost:3333/api');
var mongoose = require('mongoose');

// Set up db helpers
mongoose.Promise = global.Promise;
mongoose.connect('mongodb://localhost/cars');
var db = mongoose.connection;
db.dropDatabase();

describe('GET /api/cars', function(){
	before(function(done){
		api.post('/cars')
		// Setting the headers for the request
		.set('Accept', 'application/json')
		.send({
			// The entry we want in the DB
			"name": "VW",
			"description": "Fast car",
			"image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTYah7BY21g2R_CmAY--DdDLRbkCa7TUb0GYv-d9odMuJuLOVlyjw",

		}).end(done);
	})

	it('Should return a 200 response', function(done){
		api.get("/cars")
		.set("Accept", "application/json")
		.expect(200, done)
	})	

	it('Should return an array', function(done){
		api.get('/cars')
		.set('Accept', 'application/json')
		.end(function(error, response){
			expect(response.body.cars).to.be.an('array');
			done();
		})
	})

	it('Should return an object that contains a field called name', function(done){
		api.get('/cars')
		.set('Accept', 'application/json')
		.end(function(error, response){
			expect(response.body.cars[0]).to.have.property('name');
			done();
		})
	})

	it('Should contain name and description as strings', function(done){
		api.get('/cars')
		.set('Accept', 'application/json')
		.end(function(error, response){
			expect(response.body.cars[0].name).to.be.an('string');
			expect(response.body.cars[0].description).to.be.an('string');
			done();
		})
	})

})

describe('POST /cars', function(){
	before(function(done){
		api.post('/cars')
		// Setting the headers for the request
		.set('Accept', 'application/json')
		.send({
			// The entry we want in the DB
			"name": "Nissan box",
			"description": "Clown car",
			"image": "data:image/jpeg;base64,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",
		}).end(done)
	})

	it('Should match values from the input and inside db', function(done){
		api.get('/cars')
		.set('Accept', 'application/json')
		.end(function(error, response){
			var res = response.body.cars[response.body.cars.length - 1]
			expect(res.name).to.equal("Nissan box");
			expect(res.description).to.equal("Clown car");
			expect(res.image).to.equal("data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBxQSEhUTExMWFhUXGBgXGBgYGBgXFxoYFx0YFxoaFxgYHSggGBolHRcYITEhJSkrLi4uGB8zODMtNygtLisBCgoKDg0OGhAQGy0lICYtLS0tLy0tLS0tLS0tLS0tNS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLf/AABEIALYBFAMBIgACEQEDEQH/xAAcAAABBQEBAQAAAAAAAAAAAAAEAQIDBQYABwj/xABJEAABAwIDBAcEBwUGAwkAAAABAAIRAyEEEjEFQVFxBhMiYYGRoTKxwfAHFEJSktHhI1NygqIVM0NiwtI0svEXJERzg5Ojs+L/xAAaAQADAQEBAQAAAAAAAAAAAAAAAQIDBAUG/8QALxEAAgIBAwIDBgYDAAAAAAAAAAECEQMSITEEQRNRoSJhcYGRsQUyQtHh8BRSwf/aAAwDAQACEQMRAD8A8iqO7ccRHnKKwDyRlF5BEG+6UHjDDvAKz6Nsa7OXaiImYNwCLdyU9mxQJW7NcXBrjaAQT2TNpi144IdzWtjL2XagiZndMmBcX5rQ7Vp52Tky0wQ1jpJLsupNp7vNZztezqSB4gwR3ys4uy5oDxZMXJIkwlq93D81HiPifipHC3it62MmRu18velATnj58Ug+fiqSETUXkAhuru6SAL24c+5EUKrcwmfYyib62ExuufBBscQZHzuSMJGiiWOykzi2FzUrnExv4JGqxDKQknwnzap2i3zwChw5hx8O/gbTyRLyRwjkOEKaAcGT8/xa+Sv9h4iHzqbgzGrm4oieJ0+YVEHXNtA7/UlpYzI6Q7KQd3849zovxToLNj0vxVNuGdEBzqhZAi4aQTYbreoQOzK1Y9W5r2gEt0cbSQNw3fBZnb20uvqEj2ZcR/Mc3zyRnR/bDaQAqSQHSIj4kLOSb2RcWlyejdJscBWBBHs058gs90ZxufaVarwZinf01D8QqjaO2aFaqKk1I7MthsdmBEh2lkuxto0KNepVzOy1G1GZctwKuuh3fMLsnvCKXZHJjjpnJvuy36NbaaKoHsy11++yrhXOSREms8XAOgbxHehcFRosdmFcG1uyQd3FOo4YfvGxmLteMfkqy3KycUYw2LDpKMmGqQf/ABWX8LSsTiWEBpJu+Tp3ka71qtpEPpmm58ftjU0JsQR53VZjMKHhgNQhrGwyGgySSSTDuydNeC5sq9o6MX5SvYypVBJLnBg5wCfz+CWIEeamq4dtOMtRxMEnshscL5zM8kNn/VQtjQjdR4I+nXLKeQHW077+9QUXgkAzrqOCPw+EBixJh5IMAdkEgg8bBDUa3J5K1zBcnWPP9fyRLcUQc0AEiLcPDkCkxTs8GMjQBDQDoQL3vJsZ3zusoKTLgCddY9YSpDoSrjHh0tJEGZbx7osh3GW7ye9bFuBY+m0NylzC0bw5wqBw9mJeWvggAC0zqqTA4RzzqwNaHuzXI5dkHgAN19dYTZSRSNLgZEjvClNRz/aPM7zPHyXoNPZ1SjTrsFNlVr2OaKliAw/4jGlmYEBrhMjUcFiX0nvc6WmbkkMgW3w0QN17C6VgCZyLArkXSwbCJNZrTwLSeVweEWXJa/7uIG2i79p4BXfRHEhtUsOjnOa2dzjZpjwGqHc1WOxsC2pJc6DYC4EOu7MZ4QVrljtYsct6NntWo76sM/aykGdJkCx4ae9YDF4pzj1gAAktEN3/AMRvPhZanG06hokSLEuzCO0119JvqBPdoqbDYbOwZ6rGhrh2oAuJMDM3e0xOi5YtI6JJszOKt6z6ypJsptsRYzIJdl1JIEjU66aj7pULdPBdcHaOeWw9sXngfPcoQnVCmgqu5IpXAfBcSo3VQgCRcBqofrA4FIcR3JWOiai0HNJ4KavWDRBM+/7Q+KANQqb6wCxrcgzAkl28gxAnfvSA41XOJuQDPOJJSNhu6VE5xXQkx0IdU9mojXcmAKRoUDDKVGHDMQ7tCQCCP1SFkk7tT6/koKZIIMaJ9WpM2N+S1sinZzuy5zTcTH6hGYGs1phwtud+aCxJLjm3mJ8o+Ckwo3OFlUWElsaXDPBDYFyT5BPfRbMFovvAvfcqfA4hzI0LRMSSCJ5Kwq4zMQQA3fd48Ny2U3J00YaK3sbtHYee7Dfv171UYzDgPytB8WxffvPLVaWjiiLkNP8AC6T42XYuo2prTg7jdY5IJcGkJvuZ1lEiw1N+OiLp0HZYPAzpcQZ/JTuwt7GO4yitl4IGpD6jWNLXNzHNAJBgnKJiVg20jVNAG2aI6yJgCnS/+umBrzQ2z6F54Kz21SBquy9prSAHDRwa1rZHd2T5oja+ym4fA0MQ0uz1KjmmT2YGcggASD2Rv4qXkSq+5SjdmidtBlPDH6uCHspUQ55u01gGXDXB3aEWFu7vz/RjZTjUc1oc5xaR2Q6GmxzGBxtMRqqbEdKcW9vV9YQyB2Wsa0dkBgJgSTAiSVWuxtXe919e0b803Gx2eo7V211OGGEpnrHU3ZXFudom5ylw9oS49kToeawYwZqPLQ4Fwa55BgezchreMXvwVLSxdRtmvc0cASBpGg7rclb9FNjVMXVdTpvFPKxzy6DoIEWjWVLioJtsErZA6vHstkfHu7lyruu0glctNKJosmXhWOyQXZmgWMT6j4lUFOuQZ+K03R/Him587xnbF/TU2P8ASrzT9lqhY4+0W1TDyC5+gsf4Se/SJniqnpASIptAAZ2iB2RvAl03iIjvFlpMUWlpBNpi2syAR57lnOktdrXw2o1wNzeXAwNd8Xi9rHeuOG8kdMtkzM42o5waHbraDS+/U6+qRmg5I3atSMpGcFwzXuCDeZ+fBAzbeuyDRzMckA7kyUhKuyRK7HHQWUJw7uHuS34ppUNlC9Q7h6pww57vMKSgyCCo2tQA76ueI805uH7x5qXA4J9V4p02l7naAcBckk2a0C5JgAarY7E2dg8LDsTSfiT9kggULWOXMf2g/wAzhB3ARJznkUew1GzGUsKXGGkE8BJPkFbYToniqnsUKh5tLfVwC9Io/SBhqYy0sEGgWAFRjR5NanH6TBuwjP8A3CfcxYPPk7R9TTRHzMVQ+jXGO1Y1v8Th/plWmG+iuv8AarMHIF3rZaBn0omf+HpD+Z5+CbU+lJ40pUP/AJPzUOeV/p9R6Y+YDR+ij71c+DI95KOZ9FtKINR5vM9kHlOXRI36Uqv7qh5VPzUv/ahU16ujHKoP9SevP5eoVAkZ9GWHH3zzefgAnD6OcMP8MnnUqfmup/Sc4/4eH/G/3apK/wBIVWq11OnTpB7hlaWuJcHP7ILQd996lzzvt6jqA89D8M2W9WyRul7iJ0kAmPFEUuhtHUUW8yPgTKk6S7ZbgGDC0W9toaS51wSbuc7e95sf5liMX0gxNU9qtU/GWD8NKAUoPPl3hwarFjS1TaRuj0VpNu5tNvef1CiOx8G9wYatEuNg0ZcxPAAOkrDYXCNqVB1lVrZ1fkBI5lxKloYd9OsTTrZjTIc0tyjtA9k2Gkx4kLX/ABuoq3MhS6W6Tv5GvxPRzANMPIB4Xag37F2Z+8Pg8pemFFtehTxrG/3gDagH2Xi3oQRyyrP4anQIYHC/ZzGXC030Nrb0+nwzyQ1eI/eY5ZxhKtKLs9FcNWB+rVnZwJyF7SCO+xIHegfpHwWXAYOmGkAVnkiJLRD9Y4ZolU2Fqljg5ji1wuCNQea19TLtSh1Ze6lXp9qGOLQ60ZhG47xutuU9RhyY3GUncU/mv4HiyRlaSpmd6KdHabqPWvEgzN4cA1zAQIsSQSDwzNIjVZTpFggyq4CDBgxN9OIB7r8Fetw9WhmpBxyyZbUaHkEjK4h02kHd3cAqvG7LdVcXPrGTezbz3kuW6a5E0Z0sW++iRsPxbrdnDn1JP+lZg9HDurf0H/ctp9Huy3UaO0HZw4mhAsRFqmuvyFj1LvG1/eS8S9o8zptsLbglVidgVvvs83f7Uq3siinCuejVT/vNKb3DRyggKkCs+jv/ABNL+L3An4JyqmTHk9RxOzW2IpgANEEQBO8fenUCBGi836RgCu4AQBAg+fxXqWz8XngOBc0STuExIneLj1XlXSF37eoTvcT6rHAqZtmexXOemkpcwSSuo5xQoyU8PTSz5+eY80mxkcrt/wA/P/VSNZ8/PzC40/n5+bhSMkoCT88FPs3APrvyMAgCXOcYYxo1c90WF+8kmACTCl2Js99V8NIADSXudOVjdMzo3XAgXJsJJAW5wmGpYWkCQQ0dprXe29w0q1o+191mjAYuZJic62XI0jsDs+jhqNwRTME5hFSuRcGoPsUgfZpeLpKodt7VdWPBo0C7ae0nVnZnG24SgM6iMe7G2Q4cXJKmqXEdyY3tTaEjsMIJurEMowCZ0+KKbk7kMKdpi3zHuUlLDvfOVriBrAJ9yEAzEkZjl03TwT8Q8dWwDWXT6JH4V0xldPCCmVMM5vtNI33BHvVciIWrZfRls/rcdSm4YTUP8gkf1ZVk67BIjQgc50I14+kL1j6HMBlo1sQ7fFMHuHbf72+Sw6menGzSCtlV9JdZpxZDQJDW5jvLom/8pYPBZKlWhHdIMZ11epU+84nkCZA8BA8ENs3CdZUDTpqeQXZ0cNGFWT1u+TT5bfv62S08SREKwftaTTloAbIcQGgkO1kgAnXfwVlicC0sgNAi2nkstUduEzvmI8FumpHHp0s9E6NNDxiMG/2ajTUZ3OFnx6O/lWFxNJzHuY4XaSCO8WV/sbHlhoYj925odyHYePFuU+Kl+kDBdVii4aVBmnvFj5wD4rixXjzuPn90dmdKeNTM0yVc0ppMp1A6HglzSBcaa92vggMJi8g9lpvqRdW+zsYahIygAAkmd3IrsyW1T4OWFIuMXh2Y6j17GxVbZ7Rx4cjqDzCzBoNm4IVzsUPwzzWyuDSYew6mke7c4ahaDamz2znbBa4SDuINwfELy2vBno/S+Pd7jti9avuYX6u3cfRaLo7TDcJjXTA6sAnhZ35ptbC0z90HnCYaY6upRzfs6oh7eI5gWRluUa+H3KjszPdW03BBHEXXK2/s+mLAuA3AALlrrI0nknZ71a9FGzjKAiO3H9JVUB3q66HtBxtDhmOu/suPmqlwzOPKPVquFb1Zy2s215JsCfLjw0XnD6QOIDy1xgl0zLRDnO7YsR2QbzExYzC9K6rMZJi7QDOkkkH+mPELBbfIZndEyXiZv7bnbw4CNJI0MLnizfItjJYt7C8lswb9qNf5bR831URg7hzukqXJM+cabphNJJ1XQjnHE96VlT55T+ZUYCkYEwFHyPnyRmzcE6s8MYGzckuOVrWtu573fZY0SSe4akgJmAwNStUbSpNzPcYaNJ5kwAIm5WsoVqGFaaTD1kEF7gLVajbi50osPsj7RGY7gIlOtlyWo2H0KVLD0wQOwDmaCIdUcBarUG4C+Vn2QZPaJKy+1toOrOkm24IqvjzUdnfm7gI+JQ4p0jvqD+Rp9z1MVW42CUKYN0QW2+fn5KnZRpDSqP5mub8CmmNI79QrsmgfC0zJKJcIHP5+ClwbRpFpmSQEtbDi5gmYmHM3cARIU6lwOmP2dUblcx1s4ynhG48wYPgVbbJw7qdKo0WfLvxRA9yqKQpgCRUB5MP+oKy/tNrpPWPHGaYA8w4qgK51eux3ac4OGk3tvjjp70Z9adXYWubmgRIEazu8004wA5m1JcbE74RFDGua4GcwmSDoRwPuTEZyrgntIDhAOh1BG8g6FeyV2/UdkNp6Pcy/HNV7TvENJH8qoqGDZjMbRpMH7P8AvaoAtlbBvzsye9F/Stji51Ki3eC4+JgejXea4+olrnGHzZ1dMkpan23+hg6DMwqOO5s+JIRvR9nbJ/y/EKvwmIoNnrc7idQKjmgjk1S4nbVBjD1FIsfIId1lRxsZIILspB0uF6niKqSOKUG5amzWtf2XNO+COY/SUJs/YbHOdUfBE2b/ALvyUrdo4fI1+cXaHQDmNxMEBDUtsNY8uaxxBsdG8tfyT1JdxxwTn+WLZa4rB02UnMaGtm8C0nTTy8lY7ReK2FwtYsa8gBjs3d2HG+/9nPistjNs1KmjKbO8y88bWEKz2DtUCkMNXZmpFxJeJBbJB3bgROu/euPPLdSjvTPQh0Wbw2pRoXGMpODQAxg1PsiJ7t5shKNCjPZc8uBtlpg23faW5pbGoM0pNnvEnzKKYI0AHILnn+Jdop/U5V03mzGUcJiHTkbUM6Z2tYOdytThsNGFbSqe0J0uMpMx4SjrplSmuXL1E8qp0axxqJiajoJBGlj4JvWhE7bwpbUPA3B9/r70C1veu2DtJksmZUG/XuSJkLlQjyqns2WlxNwQIsGgQS4udNgIjTUqw6IVAzEtlrSdxcSIHEWME2ud08bx4HEkP1F7TE7rAHdfuU2CpBmIpVQDlBLj7UWtqb92m9Nye6Zh3PStn18zbh1ssh2XNv8AaymO/drKxHSdnWua0TBe5tgBEAF03uQAba2VrgdqhpdEkEQGhoLpIcwF15I77KnxVQPc57bAGMmWRLrgmBNtbb/4isY7OzWUrRnKuHgkA5gCbwRPgdNyGeyFudmbErVW5aVK7gWvebAAkE9vf2mzAk6LT7L+j2gyHVyarhuJIZx01d427k31MY8iWJs8r2ZsutiHZaVNzzvgWHNxsPErabL+jdxg4irlH3GXP4jYeAK9Ow2zw1oaxoY0aAACOQFgi6eFAXPPq5PjY1WJIzexej1HDf3NMNJEF5lzzvudY7tFbChxurLql3UrmlLvyaJFcMKNwHkPinfVBvA8h+SPNAJRhhwUW2MrTgmk/ZiDIyiZtBndvtG9Mp7Iohznik3M6JJEzGljZXAw6eKSpWIqxgWfu2/hH5Lv7Pp/u2fhCturC7TRFBZVjZNPfSp/hCX+yqP7mn+AKxKe2gT3ItICpfs2hoaNO+4MbPu9VHs3o5SpjK2hTDJJh81HEn/M4mOVwj9obSpYcH7TgJLGwXRxcSQGjvcQsnj+k1d46xjmNaA4saHAMc5umZ5GasP4Q1mkkhbY8OTJxwS5JG0weBp0iSxjGkiCWtDZHCwXm30lYc1K7CDllkTrME7ptqvRaeMz0G1MpbmAsdQTY8xwO8XWN6ZsOWm8DQuBMAxMEa6aFRhtZE+51dNGM8ijLhnmtTo+53svLj/DbzGiAr7JqM9pvkc3mBceK1NV5dqSeZJTF6kcrR6M/wAOxPjb++8r9iV5Ba4nsxEAafPcrQkbm+ZJ90KKyVz4TbTdnTjxuEVFux1Wo7I7LYxbLAM81BsoVIcahmYjMS52+YO71Tn1DFt67ITvS1NKiZYoympf9PWdi4sVcPTqT9mHfxNs7zifEKfB46nUksMxG4jXmsx0Df8AsajDuqf8zQP9KvsBTYwuDWBpIzWESAQLnj2l5U0lJo8XqIaMrS4LB1SNyGrYgwnVHIaop44MqKPaeY5Xl03I5bx6BAF3zqp9qYvI1rTHtDfewImPFV9PGhxiCPNejilHTsYSdPcJkcFyh64BKtdhWecUsHk7QcZF+F/iEXWDg1rm3dcnSBlMzJG+2qa1zi8Sb7jFgrUYYOa5sEB7HgDRsgbhYm+UkbvdOSVMwfJBh2VM7g1ge9xa1jZvmc4GWgTeAZg6G63/AEc+j8sAfiYL9crbAdziIzn05rHNonrGNa9zSagAIlpABgkEXE9n0XqFOk8OLW1KsACIe87u8rDRPIqi6NopRSbLWjs7KAAIA0AEAeCnbg4QeyKz3VHZy8AN9mXOvI4yf+qWt0qwVNxY/FsY4ate7KRzDguPJBwlpN4u1Yd9XS/V1DgekGFrODKWLovedGtqUy477DUqwr1WsEvqBo4uLWjzKgLBeoXCgjKRDhLXhw4iCPMLnOixc0c7fFFBYL1KXqUUP4m+X6p2U8W+R/NOxWB9UkNNB4zbDqd8rCDoIdMd6ShttztWNba05oJ4SBZdCwZK4J1oJNJIKRPd3qt2tt2qw0m06VJzqhNpdujgNZcEmztvudVbSrU2sc8HI5ji5pIkwQQC0wDx4LmyS0S0N7m0YScdSWxctpAJSnlNJQkQZvbPR41GmmzKG5+tY4hrurqF2Z3ZdIIcTmsDeRACfsjovQw5zn9rVtNR9zbTKNGgbuG5XpKgrOgFdDzTcVGxKKTsD2jtJolkSbH58ln9v1jUwdZ5aAGuptbvOYuaC7wDo8SnvqZqrvBTbdpgbOrDgA7yc0/BZraSNsbqSfvPMi4puZRPcmB69Cz6Sgpr05jgdUGKgiBc9100uP8A1PyU02KVJbsKeU4VICCdWjV3zzKZ1k7ieenwCrSzmfU4lsnfw3+xv+gVXsVrgdpkTyctXQeQDI3chx1dA3LA9EKFd9N/V1+oZmvkY0vJjifZtHFXrejlE3quq1zxq1HEeQgLzs2lTdv6Hk9RJyyN19RvS3pjSwtImm5lSseyymHB0Hi/KbNGvkN68gx+3MZWfmdWqucbgMc4NHJrLDyVp03r0zintpMaxlP9m0NAAkXeTG/MSP5FQ0a5aQ4HQz89y9DBhjGF92cE5NssKe2atQnrHFzhaXTI7o3LZ9HaOeix5e6TmBAvMOI3+G9ZfGs659LIJc9swNY1Adwi+9bTBO6ukxkA5WgQDB7+IWk2tKTQowthnUN3j/l/IpUF9YfxjlB9d65Rt5F6fgVNPZrKdy6b2i5i2kcL24hF1a+YQ0jLMZQDMb7nfaTA9ElOoTq0tJbMkDdeOFzw70DjK/Vh33pzWmBcW5X965abdGbTDNlYOtUqUXN7RaQXDM1pADgTAcRPHWZK9OpbVxDXCKRAFtJ88kyvGaGMdUMBhdHM6+KLZjTTMQ5nm1bR1QlpjJX5d/uXpbgm06R7vQxgfUtmktOYuY5okQBEtAWM6WbBrPfNHCYKs0gT1rXtdbQAtMEBYF/SGtEMrVW9+d/ulGYfpTibBteoTYahxJ8Qss2DLOWvYqE4xVFlS2FiWOa4bJwgc0hwcys9hBFwQZsQVq34uriqYbisHVpVBo6k6nUb4dsO5iFj29KsY3Ws8c2U/i1EUum+JGtQHmxvwWL6fPd7epeuDNTg8a/CNy06GJrEwBLWNa0SZkl5JN+Q4azm+kROMI6/ZGK7JMOZWEmd5BF9PBKOnmJG+mebD8HJw+kDEcKH4H/71P8Aj5tWpq38wU4rgz7+j+HGuztpt5ZHfBaPoPs+jTfWfTo46k4Ush+sANYRUc1pyxq4fFMd9IlcEfsqLuMZhHmSp39PnOaWupUiDYiSFXh5u69f5BzibDaxZLXF2okjxKlwBo1G9W0HrHaRy1PcO9YI9LWHXDsP/rVAn0elrAZGHjliqnxC7vHkv0P0/cw0e80W2B1OJoB59mSLz9pskcNFXbQb+y61l3Ml7Sdz2Ozt9yqsX0iw9Utc+g+WiBGJfYG8KtxG28KNMLmn95iazx+DReL1XRZs+fxI2lafbyXvPQxdRDHjUWesUsSHta9vsuaHDk4SPQpDUXktXp5Xa0MYaVNjQGtDGGzQIAEuIsO5U2K6Y4kgk4ipzGVkcsgC6o9Fmfkjl8SKPYdtbfw+EZnr1QwHQauceDWi7jyXnG3/AKXGuaWYeg7WM9QgCOOVt/VebYrEuqu6yq5znO0zEmG7tVA4g2hd2LpFFe1uZvL5HpXQzpmK1Tq6zQ17rNInKTuF9CtX0g2xSGEq0usp53NLcuaXTMeyAfVeSbAotDC4HtA3O8bxH5r0vb+zqLqDq7mNL6lMOLhxMCQJgHkufPjjDJG+H9zXHJtHn73tBuSTw09P1TC/gzz/AP0lr4loJEjwUBxg3Bde3ZHuKMn+bJ9Nv3JiHcQPVIGcST4/khziHHRKzDvdxRqY1hx/638d/uTmo1vAe9RuxQ5qWnsw7yrLDbBMSWwPvPIY3zfAPgockuTRvSuyRoOiorNoANbGdxf4EAD0E+K1DqZo0X1qhLi1pMcrwAgsX0ywOHENdni0MFrf5nQFldt9PDi29VSpBlOQXOLpJykEARbUCfFefHFPLO62s8PLltuTMPWoOq53TJF3HeSZc4+fvTcPhy6AQRaBO8E5Z8CQnUCddwcMxmI9mJ7raqxwLGvePvOfeLgNs0X3y4jSbAL2zgA9k7T6l4JaDbKSdQJm3p5LcU6wcAQQQdDMyvNa57S1XRbGuczJk7DB7cnUmYiO9E4JqwT7Gpexg0cT3hn5lIhpSLOiyKlW7JvaBf3kckFjAC0tntOmxtfWRHtG829bQLh8BUc1xlwaASbgDubEam9hbkpcO32usbPZkXJggECwNrk+S491uYXIqcDtB9F2ZhyuB1GshS7R2vUruzVDLtSbDXkEbtemHMPYA07UmTBtlkzF/VUdTCcHO810QhjnLxNKvz7myyz06b2JRieasNj7T6uvSqGRkqMd4NcD8FU4fZzCTne4DuEnlaPVRu2dqG1HgX1EmPNdBJ9LPxVSwJBlxHZLm+y5rJuTAl0R3SmYbEOc6wzAkgZnwLtztHsmTAMndbWVhqPT/DNaC975NzmbUytLpL2jqw43cGkGIETrZH4fp7s4OzMxWVwDcrXMrtFuzDnvpkRA1F+HfpFpoxyxkpR08d/oEdPstTAOqZGsNJ9J9jLoeMtzkFu23SdBovJDi+/1Xo/Sjpfg62Cr02YmkT1GVjC6TmZLmhsN7ZLmU95id2/xlmIqESGgjl+qiXJqlRo2YkcfVLVeYsTKzjK9Q/4foVNSrVDE0XRxDXfldSxo2mCpYdzofWcwcnFQ4s02khjy4TY8Rxust9ZExldI17Jkc0pxA4O8iuSHSyjPV4kmvLsdM+ojKNaEaSpjR1TmzvB0E+eqon1O9DfWm8D5FM62dGny/NdiOYIdUQ9U5y1m43d/C2/qnNk7oT8G3svqcTlHJtvfKYgHEPlx+HlA9ybQZmJkaTYa6eu6UVhqVw8xlBl07w2BA5y7ySUy9js5gZXRlkZuOmpEb0mMds+qadQcDAPe10fofBendLgaWBw9OYJaxx1454M8SAvMtr0YAjeHD4j0eFvuknS/D1h/d9YIGUE5QLb4uALri6pPVCle5vgaTdmUobLJEmw71Z4fo86Mxbb7x7LfxOhvqq6t0tc21Pq6X8DQXfjMu9VS4zbjqhlxc88XH85TrJLhUek/xCEFUY/U1rqVCn7VZvJgNQ+kN/qUNTbdBnsUy7vqPgfhZB/qWKqY1x3xy/M3UJeTqVounb/MzlyfiOWXDr4GsrdLHj2C1n/ltDT+P2j5qlxO1qjzJcZ4m58yqyVLh8O+oYY1zj/lBPnGi1jgxx7HHLLOXLHVqpdclXrPZblsLfPqh8H0YrP9otYO85j5N/NGYrAOoZW9pzY9vLad4MabtVTa7E0yqqAy5oNyfO+nxVphD1LHPJl5BaP4jYAcYBLidAQ0Kqq3cSLxqjcJsutW0aQNMzpAju4qrQqHdHdnCtUcXCWtAPdM2B46FbiiwNAAAAG4CB4AIbZuzW0WBjeZO8niUYGqJO2UlQi5LCVIYAzORlyAR9pzmTG+J1OthxKmGyHACXtAi8GTebaC90fUrg2Ij8u7yUYkmYsuXwwUUVzdluB7ThlB0Pa47zxvcygavR6TLKkdxBt4zdaTqeO9KKbW6wrjceB0jzzH5qVQ0zJIjQTIImw14od2OymCYMAwRxEj0Wr6Q4alV/aNa17m9lwOuXW0bxJ/EVldp7OpkZqdhwnN79Fsp+YnHYUbQHFvuTvrYP3fP9VTVcKQJsQoTK0IL0vB3ApQ4cFQpweeKBF8Ht70oc3iqEVncT5lTMxXEv8ABw+LUDL2jUaDqiW4lvEeqy31t3H3JW41/H0CKEa6hWp/aLQOT/yQ21sfTc7sAgCyz9fGkGGvzDjky+hQ7sU87/h7kICzq4k6Nbc2HMout2KQbwgH1VdsUBzyTcgAjxsVYbT9k+B8kXuMGogva+8BtP3vfbnLvfwRbXtAOYNbkDwQ2DLi0xcTI0vxAVOKhAkckXhGF5AI/Zg9o8Y+yO8oAP25alRB1DBPgym33tKzJcTvVvtvFZzyEepJ9SVW4bDOqODWiXHQJiIU5jCTAEngLnyC3Wz+i1FoBqAvdF7nLPcBFuavMPh2sEMY1o4NAHuUOfkXpPPML0fxD9KZaOLuz6a+it8L0NOtSqOTR8XfktjClBGWMomZzSdI0jTxUObHpRQ4To5QZ9gOPF3a9DZWtKiAIDQBwAspxyXEpbsYwUk4sHelSgnROgGwnQkSoEdC7KuKa1gGm9MB6RIlQAyniGl+RgzOuY1cQNbJajqpa4tyjK7KczgHTv7HtaKGqQ52cCmwxByNABiDJ1nTuXNcIPtEkkmTYk7zfxWNt8I0SiuTusqe1lhmaA7OCN6A+qvfJcXOmdZ1P+XxPpEIqqA4yefikCNLK1pcC0KbWNIHtEzG4AW0tew04Ce4Ktsym8kllzqQSPQGEbmTi7v96ahRDnZWf2DR+6TzJ9IPvlSN2PR/dM8Wg+9GOfPz+qQOV0ybAjsfD76LPAQfRQVej+HP+Frwc7/crYJyLYFE/oxQO5w5OPxlDv6J09z6g55T8FpUsI1MVIyNXol92r5t/VDjopU++wea2mRSHDEap6mFIwjuitXc6mfFw/0qI9Ga8xlae/MI9brfiimo1sNKMTgtgYhjw7KI0PaGhRNYTIPIrXFqCxuyG1DMlp3wBfn3+Sep9w0mFfTyGEQ7EmNf05cFoq/RfN/ij8F/+ZTYXotRb7WZ57zDfIfElXrROkyWEwFSu6GCw1Js0cz8FtNi7HbQbYS86u49w4DuVpSohoDWgADQAQFIApcrGlQwNS5U9dCkYgalhclQBwSJZShADVydCVMBsLoSrkAIlSLimIUpF0rkABgp2q5coGNITcq5cgB4CR5AXLkAcXQ09kXIE7xqbd1vchKld8/Z8ly5AwijUlt04P5rlyBBFGlmMTdK8ZXRrv8AguXLNt6kiq2GQuhIuWhIickXIAcClBSLkwHgpVy5ACrkq5AHQlSLkwFIXFq5cgBpMJQ6Vy5Ahy6Vy5ACLiUi5MDpSFKuTAYlXLkCP//Z");
			done();
		})
	})
})

describe('GET /cars/id', function(){
	var id;
	var name;
	var des;
	var img;

	before(function(done){
		api.post('/cars')
		// Setting the headers for the request
		.set('Accept', 'application/json')
		.send({
			// The entry we want in the DB
			"name": "£200 Car",
			"description": "Affordable car",
			"image": "https://testing.co.uk",
		}).end(function(error, response){

			id = response.body._id;
			name = response.body.name;
			des = response.body.description;
			img = response.body.image;
			done();

		})
	})

	it("Should return a matching object from api and db", function(done){ 
		api.get('/cars/' + id)
		.set('Accept', 'application/json')
		.end(function(error, response){
			var res = response.body
			expect(res.name).to.equal(name);
			expect(res.description).to.equal(des);
			expect(res.image).to.equal(img);
			done();
		})
	})
})

describe('DESTROY /cars/id', function(){
	var id;

	before(function(done){
		api.post('/cars')
		// Setting the headers for the request
		.set('Accept', 'application/json')
		.send({
			// The entry we want in the DB
			"name": "£40000 Car",
			"description": "Not so affordable car",
			"image": "https://testing.co.uk/real-cars",
		}).end(function(error, response){

			id = response.body._id;
			
			api.delete('/cars/' + id)
			.end(function(error, response){
				done();
			})
		})
	})

	it("Should return a matching object from api and db", function(done){ 
		api.get('/cars/' + id)
		.set('Accept', 'application/json')
		.end(function(error, response){
			expect(response.body).to.be.a('null');
			done();
		})
	})
})
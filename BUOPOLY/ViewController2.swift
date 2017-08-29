//
//  ViewController2.swift
//  VirtualCollegeVisit
//
//  Created by HeWilliam on 4/5/17.
//  Copyright © 2017 HeWilliam. All rights reserved.
//

import UIKit
import MapKit

class ViewController_2: UIViewController {

    
    @IBOutlet var map_view: MKMapView!
    var locationManager: CLLocationManager!
    var valid_code: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //GOBU will give a map with BU landmarks on the map
        // 649645272 will give Elizabeth unique locations
        // other codes will direct people to different schools
        
        // set initial location
        var initial_location = CLLocation(latitude:42.350923, longitude: -71.103910)
        let region_radius = 200.0
        
        func add_annotation(title: String, coord: [Float64], sub_title: String ){
            let new_annotation = MKPointAnnotation()
            new_annotation.coordinate = CLLocationCoordinate2D(latitude: coord[0], longitude: coord[1])
            new_annotation.title = title
            new_annotation.subtitle = sub_title
            map_view.addAnnotation(new_annotation)
            
        }
        
        func centerMapOnLocation(location: CLLocation) {
            let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,region_radius * 2.0, region_radius * 2.0)
            map_view.setRegion(coordinateRegion, animated: true)
        }
        
        // centering on self
        centerMapOnLocation(location: initial_location)
        if (CLLocationManager.locationServicesEnabled()){
            locationManager = CLLocationManager()
            locationManager.delegate = self as? CLLocationManagerDelegate
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestAlwaysAuthorization()
            locationManager.startUpdatingLocation()
            
        }
        // valid code == public code
        
        if(valid_code == "GOBU" || valid_code == "gobu"){
            //clear all other annotations
            let allAnnotations = self.map_view.annotations
            self.map_view.removeAnnotations(allAnnotations)
            // change title of NavBar
            navigationItem.title = "Boston University"
            initial_location = CLLocation(latitude:42.350923, longitude: -71.103910)
            centerMapOnLocation(location: initial_location)
            // add public location of interests on map
            
            add_annotation(title: "The Snail", coord: [42.350174, -71.100222], sub_title: "Statue")
            add_annotation(title: "East and West Towers", coord: [42.350063, -71.099836], sub_title: "Residence")
            add_annotation(title: "Warren Towers", coord: [42.349341, -71.103992], sub_title: "Residence & Dinning Hall")
            add_annotation(title: "BU Beach", coord: [42.351212, -71.106138], sub_title: "Best Place to Hangout")
            add_annotation(title: "Yawkey Center For Student Services", coord: [42.349769, -71.097909], sub_title: "Come here for Help!")
            add_annotation(title: "College of Communications", coord: [42.348891, -71.102482], sub_title: "Educational Building")
            add_annotation(title: "Questroom School of Business", coord: [42.349622, -71.099561], sub_title: "Educational Building")
            add_annotation(title: "Explosion", coord: [42.348921, -71.100293], sub_title: "Statue")
            add_annotation(title: "Scholl of Social Works", coord: [42.350845, -71.105237], sub_title: "Educational Building")
            add_annotation(title: "The Observatory", coord: [42.350300, -71.105675], sub_title: "Educational Building")
            add_annotation(title: "Metropolitan College", coord: [42.350455, -71.107568], sub_title: "Educational Building")
            add_annotation(title: "Morse Auditorium", coord: [42.348904, -71.100908], sub_title: "Educational Building")
            add_annotation(title: "The Stone Chairs", coord: [42.348653, -71.101804], sub_title: "Statue")
            add_annotation(title: "Fountain", coord: [42.349152, -71.102205], sub_title: "Statue")
            add_annotation(title: "Campus Trolley", coord: [42.349887, -71.103260], sub_title: "Best Fried Chicken on Campus")
            add_annotation(title: "Granby Street Park", coord: [42.350379, -71.103272], sub_title: "Park/Leisure")
            add_annotation(title: "The Castle", coord: [42.350848, -71.103620], sub_title: "Historical Building")
            add_annotation(title: "Boston University Clock", coord: [42.349946, -71.104583], sub_title: "Historical Building")
            add_annotation(title: "College Engineering", coord: [42.348657, -71.103093], sub_title: "Educational Building")
            add_annotation(title: "Peace", coord: [42.350353, -71.106558], sub_title: "Statue")
            add_annotation(title: "School of Law", coord: [42.350973, -71.107023], sub_title: "Educational Building")
            add_annotation(title: "Engineering Product Innovation Center", coord: [42.349898, -71.107912], sub_title: "Educational Building")
            add_annotation(title: "College of Fine Arts", coord: [42.351354, -71.113901], sub_title: "Educational Building")
            add_annotation(title: "Exhibition Gallery", coord: [42.350332, -71.111606], sub_title: "Gallery")
            add_annotation(title: "College of Studies", coord: [42.351269, -71.114640], sub_title: "Educational Building")
            add_annotation(title: "FitRec", coord: [42.351646, -71.116898], sub_title: "Gym/Educational Building")
            add_annotation(title: "Boston Playwrights' Theatre", coord: [42.351722, -71.118819], sub_title: "Theatre/Historical Building")
            add_annotation(title: "Nickerson Field", coord: [42.353331, -71.119157], sub_title: "Athletic Field")
            add_annotation(title: "Claflin Hall", coord: [42.352650899935725, -71.11985651044843], sub_title: "Residence")
            add_annotation(title: "Sleeper Hall", coord: [42.352956155766755, -71.12054047374723], sub_title: "Residence")
            add_annotation(title: "Rich Hall", coord: [42.353641984888775, -71.1203366258621], sub_title: "Residence")

        }else if (valid_code == "649645272"){
            //clear all other annotations
            let allAnnotations = self.map_view.annotations
            self.map_view.removeAnnotations(allAnnotations)
            // private for Elizabeth
            navigationItem.title = "For My Love, Elizabeth"
            
            initial_location = CLLocation(latitude: 42.350625, longitude: -71.101071)
            centerMapOnLocation(location: initial_location)
            
            add_annotation(title: "Your Room: 189 Baystate Road", coord: [42.350633, -71.101065], sub_title: "My best memories with you")
            add_annotation(title: "Educational Library", coord: [42.349871814377806, -71.10069212703702], sub_title: "This is where we studied together")
            add_annotation(title: "BayState Dinning Hall", coord: [42.349871814377806, -71.09789994745252], sub_title: "Your favorite late night spot")
            add_annotation(title: "Warren Towers", coord: [42.349341, -71.103992], sub_title: "我们在学校首页出现了呢")
            add_annotation(title: "College of Engineering", coord: [42.348657, -71.103093], sub_title: "还记得我们在房间里做了什么么")
            add_annotation(title: "FitRec", coord: [42.351646, -71.116898], sub_title: "我们一起游泳的时候")
            add_annotation(title: "My Room 1313", coord: [42.353641984888775, -71.1203366258621], sub_title: "我好想你")
            add_annotation(title: "麻辣香锅", coord: [42.35255179058085, -71.12549451379773], sub_title: "还有鸡汤，盒饭！都是你的最爱")
            add_annotation(title: "我们的家", coord: [42.34140297293224, -71.1549183466911], sub_title: "我会在家里努力学习工作，等你回来。你一定要回来哦！")
            add_annotation(title: "Limelight", coord: [42.357233545812036, -71.06135753183362], sub_title: "你说你想唱歌你想玩,于是我们就去唱歌了")
            
            add_annotation(title: "Room 205", coord: [42.34968944498083, -71.10584733276364], sub_title: "我对你是一见钟情呢")
            
            
        }else if(valid_code == "RUC" || valid_code == "ruc"){
            //clear all other annotations
            let allAnnotations = self.map_view.annotations
            self.map_view.removeAnnotations(allAnnotations)
            //for RUC students 人民大学
            navigationItem.title = "人民大学"
            //centering on RUC
            initial_location = CLLocation(latitude: 39.969577999999984, longitude: 116.31370999999999)
            centerMapOnLocation(location: initial_location)
            //defining locations of interest
            add_annotation(title: "一勺池", coord: [39.97057290628218, 116.31068983264922], sub_title: "有名人大海，七星池")
            add_annotation(title: "双趣园", coord: [39.971645908810125, 116.31092318483351], sub_title: "")
            add_annotation(title: "丁香林", coord: [39.97191312904211, 116.30935945697783], sub_title: "")
            add_annotation(title: "求是园", coord: [39.9696108896953, 116.3179264325714], sub_title: "")
            add_annotation(title: "孔子像", coord: [39.96975067072384, 116.3130287189102], sub_title: "")
            add_annotation(title: "公共管理学院", coord: [39.96947933081909, 116.31615617462157], sub_title: "教学楼")
            add_annotation(title: "莫扎特音乐厅", coord: [39.97030979197961, 116.31296434589385], sub_title: "")
            add_annotation(title: "图书馆", coord: [39.97198712830625, 116.31508329101561], sub_title: "")
            add_annotation(title: "理学院物理系", coord: [39.970819575021004, 116.31456294246672], sub_title: "教学楼")
            add_annotation(title: "明德商学院", coord: [39.97138279863791, 116.30723246522902], sub_title: "教学楼")
            add_annotation(title: "明德法学院", coord: [39.97155135370856, 116.30881228633879], sub_title: "教学楼")
            add_annotation(title: "松竹苑", coord: [39.96942588495331, 116.31374486871718], sub_title: "")
        }else if(valid_code == "TSU" || valid_code == "tsu"){
            //clear all other annotations
            let allAnnotations = self.map_view.annotations
            self.map_view.removeAnnotations(allAnnotations)
            //for 清华大学
            navigationItem.title = "清华大学"
            initial_location = CLLocation(latitude: 40.000556945800795, longitude: 116.32611083984399)
            centerMapOnLocation(location: initial_location)
            //adding points of interests
            add_annotation(title: "三峡石", coord: [39.99987684513713, 116.31617861986184], sub_title: "清华风物志（奇石篇）")
            add_annotation(title: "太湖石", coord: [40.006970432204966, 116.32348924426516], sub_title: "清华风物志（奇石篇）")
            //人生哲理
            add_annotation(title: "行胜于言", coord: [40.00204862323142, 116.32457125186944], sub_title: "座右铭")
            add_annotation(title: "刚毅坚卓", coord: [40.005200352390226, 116.32705229520822], sub_title: "座右铭")
            //亭园
            add_annotation(title: "近春园", coord: [40.002052732490625, 116.31981837749505], sub_title: "《荷塘月色》中的荷塘")
            add_annotation(title: "莲桥", coord: [40.00156167426449, 116.32080274820352], sub_title: "历史遗迹")
            add_annotation(title: "临漪榭", coord: [40.00155140104213, 116.31933557987237], sub_title: "历史遗迹")
            add_annotation(title: "晗亭", coord: [40.001793735046775, 116.31950737563527], sub_title: "历史遗迹")
            add_annotation(title: "闻亭", coord: [40.00356812598171, 116.32365017680605], sub_title: "历史遗迹")
            add_annotation(title: "母育子", coord: [40.001004863383955, 116.32274734973932], sub_title: "历史遗迹")
            add_annotation(title: "清华世纪鼎", coord: [40.001736318808156, 116.32522302866006], sub_title: "历史遗迹")
            add_annotation(title: "牡丹苑", coord: [40.00284581488731, 116.31924706697488], sub_title: "历史遗迹")
            add_annotation(title: "旅顺樱花园", coord: [40.00402925749942, 116.31954479217553], sub_title: "历史遗迹")
            add_annotation(title: "马约翰雕像", coord: [40.00467438945065, 116.32162350416208], sub_title: "雕像")
            add_annotation(title: "紫荆雕塑园", coord: [40.00942434529455, 116.3323255181315], sub_title: "历史遗迹")
            add_annotation(title: "世纪林", coord: [40.00690970395916, 116.33379268646264], sub_title: "历史遗迹")
            //教学楼 + 著名建筑
            add_annotation(title: "蒙民伟理科馆", coord: [40.00543445533293, 116.31889583197987], sub_title: "")
            add_annotation(title: "生命科学学院", coord: [40.00671646862595, 116.31950737563527], sub_title: "教学楼")
            add_annotation(title: "化学系", coord: [40.005960412416876, 116.31937862960255], sub_title: "教学楼")
            add_annotation(title: "社会科学学院", coord: [40.00611655514613, 116.32222177115834], sub_title: "教学楼")
            add_annotation(title: "机械工程系", coord: [40.00599249198336, 116.32723360804995], sub_title: "教学楼")
            add_annotation(title: "环境科学与工程系", coord: [40.00578704057627, 116.32687955645999], sub_title: "教学楼")
            add_annotation(title: "水利水电工程系", coord: [40.0035927809845, 116.32548480777224], sub_title: "教学楼")
            add_annotation(title: "大礼堂", coord: [40.003732492498926, 116.32435827998599], sub_title: "")
            add_annotation(title: "公共管理学院", coord: [39.99878488703033, 116.33136420993289], sub_title: "教学楼")
            add_annotation(title: "纳米科技楼", coord: [39.9985054434676, 116.32890730647524], sub_title: "教学楼")
            add_annotation(title: "航天航空学院", coord: [39.99855475712059, 116.3335099771448], sub_title: "教学楼")
            add_annotation(title: "材料学院", coord: [39.998480786627745, 116.33389621524294], sub_title: "教学楼")
            add_annotation(title: "美术学院", coord: [39.99971361771391, 116.33480816630801], sub_title: "教学楼")
            add_annotation(title: "化学工程系", coord: [40.00288600070661, 116.33348851947268], sub_title: "教学楼")
            add_annotation(title: "建设管理系", coord: [40.00528443246882, 116.32995945581754], sub_title: "教学楼")
            add_annotation(title: "清华科技园", coord: [39.994682222751024, 116.33075875410398], sub_title: "")
        }else if(valid_code == "PKU" || valid_code == "pku"){
            //clear all other annotations
            let allAnnotations = self.map_view.annotations
            self.map_view.removeAnnotations(allAnnotations)
            //北京大学
            navigationItem.title = "北京大学"
            //历史遗迹
            add_annotation(title: "鸣鹤园", coord: [39.995290999462476, 116.30530685186426], sub_title: "历史遗迹")
            add_annotation(title: "校景亭", coord: [39.99621361324872, 116.30655407905618], sub_title: "历史遗迹")
            add_annotation(title: "红湖", coord: [39.996675942863426, 116.30704492330591], sub_title: "历史遗迹")
            add_annotation(title: "镜春园", coord: [39.99677662756447, 116.3090056180958], sub_title: "历史遗迹")
            add_annotation(title: "采薇阁", coord: [39.99759853793937, 116.30933284759561], sub_title: "历史遗迹")
            add_annotation(title: "朗润园", coord: [39.998027982175564, 116.30989342927973], sub_title: "历史遗迹")
            add_annotation(title: "石雕屏风", coord: [39.995782102784425, 116.3099980354313], sub_title: "历史遗迹")
            add_annotation(title: "哲学门", coord: [39.996585531984984, 116.3117977976803], sub_title: "历史遗迹")
            add_annotation(title: "鲁斯亭", coord: [39.99469509529183, 116.30957692861597], sub_title: "历史遗迹")
            add_annotation(title: "蔡元培像", coord: [39.994323166260315, 116.30735874176065], sub_title: "历史遗迹")
            add_annotation(title: "华表", coord: [39.99452454245149, 116.30547046661417], sub_title: "历史遗迹")
            add_annotation(title: "未名湖", coord: [39.995062912618295, 116.3112211227421], sub_title: "历史遗迹")
            add_annotation(title: "翻尾石鱼", coord: [39.99430672736136, 116.30832970142404], sub_title: "历史遗迹")
            add_annotation(title: "葛利普教授之墓", coord: [39.993735473164605, 116.30533099174536], sub_title: "历史遗迹")
            add_annotation(title: "梅石碑", coord: [39.993349154668664, 116.30841553211249], sub_title: "历史遗迹")
            add_annotation(title: "埃德加·斯诺之墓", coord: [39.9938943378687, 116.30999445915192], sub_title: "历史遗迹")
            add_annotation(title: "花神庙", coord: [39.9940669471527, 116.3099890947339], sub_title: "历史遗迹")
            add_annotation(title: "塞万提斯", coord: [39.99278058652394, 116.30600333213776], sub_title: "历史遗迹")
            add_annotation(title: "勺园", coord: [39.992640852600644, 116.30544543266267], sub_title: "历史遗迹")
            add_annotation(title: "勺海", coord: [39.99252577739034, 116.30511820316285], sub_title: "历史遗迹")
            add_annotation(title: "缨云", coord: [39.99230795592571, 116.30504310131043], sub_title: "历史遗迹")
            add_annotation(title: "民主与科学", coord: [39.9883253995263, 116.30944728851289], sub_title: "历史遗迹")
            //教学楼
            add_annotation(title: "历史学系", coord: [39.99743415665578, 116.31129086017648], sub_title: "教学楼")
            add_annotation(title: "保护生物学楼", coord: [39.99702114693471, 116.30589693784754], sub_title: "教学楼")
            add_annotation(title: "生物技术楼", coord: [39.99647251821857, 116.3057816028599], sub_title: "教学楼")
            add_annotation(title: "民主楼", coord: [39.99531771228629, 116.30641460418741], sub_title: "教学楼")
            add_annotation(title: "研究生院", coord: [39.995389631375396, 116.3076564669613], sub_title: "教学楼")
            add_annotation(title: "外文楼", coord: [39.995025925490694, 116.30591571331064], sub_title: "教学楼")
            add_annotation(title: "化学北楼", coord: [39.99414233815411, 116.3059318065647], sub_title: "教学楼")
            add_annotation(title: "生物楼", coord: [39.99265318207597, 116.31175935268372], sub_title: "教学楼")
            add_annotation(title: "文史教学楼", coord: [39.99216822103547, 116.31186127662629], sub_title: "教学楼")
            add_annotation(title: "地学楼", coord: [39.99169147631727, 116.31187736988038], sub_title: "教学楼")
            add_annotation(title: "理科教学楼", coord: [39.991428443324175, 116.3129448890683], sub_title: "教学楼")
            add_annotation(title: "哲学系", coord: [39.99131336607117, 116.30865335464448], sub_title: "教学楼")
            add_annotation(title: "历史学系", coord: [39.991638047822526, 116.30763411521882], sub_title: "教学楼")
            add_annotation(title: "信息管理系", coord: [39.99113663991227, 116.30734443664521], sub_title: "教学楼")
            //博物馆
            add_annotation(title: "赛克勒考古与艺术博物馆", coord: [39.995591004421975, 116.30589693784754], sub_title: "博物馆")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

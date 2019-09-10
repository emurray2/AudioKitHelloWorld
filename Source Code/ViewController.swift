import UIKit
import AudioKit

class ViewController: UIViewController {

    //Our instrument
    var oscillator1 = AKOscillator()
    var oscillator2 = AKOscillator()
    var oscillator3 = AKOscillator()
    
    //Device which allows us to get the output to the speakers
    var mixer = AKMixer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //Hook our oscillators up to th emixer node
        mixer = AKMixer(oscillator1, oscillator2, oscillator3)
        //Cut the volume because we have 3 oscillators
        mixer.volume = 0.70
        //Connect our mixer to audiokit's output node
        AudioKit.output = mixer
        do {
            //Try to start AudioKit when the view loads
            try AudioKit.start()
        } catch {
            //Print this if AudioKit did not start
            AKLog("AudioKit did not start!")
        }
        
        oscillator1.frequency = 442
        oscillator2.frequency = 569
        oscillator3.frequency = 760
        oscillator1.start()
        oscillator2.start()
        oscillator3.start()
    }


}


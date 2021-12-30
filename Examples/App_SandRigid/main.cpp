#include <iostream>
#include <memory>
#include <cuda.h>
#include <cuda_runtime_api.h>
#include <GL/glew.h>
#include <GL/freeglut.h>

#include "GUI/GlutGUI/GLApp.h"

#include "Dynamics/ParticleSystem/StaticBoundary.h"

#include "demoParticleSand.h"
#include "demoParticleSand2.h"
#include "demoSandRigid.h"
#include "connector_use_demo.h"
#include <iostream>
using namespace std;
using namespace PhysIKA;

int main()
{
    std::cout << "Input to choose a simulation scene: " << std::endl;
    std::cout << "   0:  Car running on particle sand." << std::endl;
    std::cout << "   1:  Sand-rigid coupling." << std::endl;
    std::cout << "   2:  Car running on HeightField sand." << std::endl;
    std::cout << "   3:  Sand-Rigid Height Field" << std::endl;
    std::cout << "   4:  two car on particle sand." << std::endl;
    std::cout << "   5:  connector" << std::endl;
    int caseid = 0;
    std::cin >> caseid;

    switch (caseid)
    {
        case 0: {
            DemoParticleSandMultiRigid* demo = DemoParticleSandMultiRigid::getInstance();
            demo->createScene();
            demo->run();
            break;
        }
        case 1: {
            DemoParticleSandRigid_Sphere* demo = DemoParticleSandRigid_Sphere::getInstance();
            demo->createScene();
            demo->run();
            break;
        }
        case 2: {  //小车不稳，自动解体，问一下肖//现在唯一的问题就是车几乎动不了，猜测是牵引力太小，输出一下看看
            DemoHeightFieldSandLandMultiRigid2* demo = DemoHeightFieldSandLandMultiRigid2::getInstance();
			/*clock_t start, end;
			start = clock();*/
			demo->createScene();
			/*end = clock();
			printf("createtime=%f", double(end - start) / 1000);*/

            demo->run();
            break;
        }
        case 3: {  //出现异常
            DemoHeightFieldSandLandMultiRigidTest* demo = DemoHeightFieldSandLandMultiRigidTest::getInstance();
            demo->createScene();
            demo->run();
            break;
        }
        case 4: {  //二车//现在car2：穿模（看一下能撞的car类，和本项目中的car类，又什么区别）
            DemoParticleSandMultiRigid2* demo = DemoParticleSandMultiRigid2::getInstance();
            demo->createScene();
            demo->run();

            break;
        }

        case 5: {  //connector
            connector_use_demo* demo = connector_use_demo::getInstance();
            demo->createScene();
            demo->run();
            break;
        }

		case 6: {  //look steady,find reason.
			DemoHeightFieldSandRigid_Sphere* demo = DemoHeightFieldSandRigid_Sphere::getInstance();
			demo->createScene();
			demo->run();
			break;
		}

//+
		case 7: {  //
			DemoHeightFieldSandLandRigid* demo = DemoHeightFieldSandLandRigid::getInstance();
			demo->createScene();
			demo->run();
			break;
		}

        default:
            break;
    }

    return 0;
}

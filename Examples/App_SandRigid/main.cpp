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
    std::cout << "   0:  Car running on sand." << std::endl;
    std::cout << "   1:  Sand-rigid coupling." << std::endl;
    std::cout << "   2:  HeightFieldtext-wei" << std::endl;
    std::cout << "   3:  Sand-Rigid Height Field" << std::endl;
    std::cout << "   4:  ������" << std::endl;
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
        case 2: {  //С�����ȣ��Զ����壬��һ��Ф
            DemoHeightFieldSandLandMultiRigid2* demo = DemoHeightFieldSandLandMultiRigid2::getInstance();
            demo->createScene();
            demo->run();
            break;
        }
        case 3: {  //�����쳣
            DemoHeightFieldSandLandMultiRigidTest* demo = DemoHeightFieldSandLandMultiRigidTest::getInstance();
            demo->createScene();
            demo->run();
            break;
        }
        case 4: {  //����//����car2����ģ����һ����ײ��car�࣬�ͱ���Ŀ�е�car�࣬��ʲô����
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

        default:
            break;
    }

    return 0;
}

%module hilma

%include <typemaps.i>
%include <std_vector.i>
%include <std_string.i>

%ignore *::operator[];
%ignore *::operator=;
%ignore *::operator==;
%ignore *::operator!=;
%ignore *::operator<;
%ignore *::operator<=;
%ignore *::operator>;
%ignore *::operator>=;
%ignore operator<<;

%{
    #define SWIG_FILE_WITH_INIT
    #include "hilma/math.h"
    #include "hilma/types/Ray.h"
    #include "hilma/types/Line.h"
    #include "hilma/types/Material.h"
    #include "hilma/types/Triangle.h"
    #include "hilma/types/Plane.h"
    #include "hilma/types/BoundingBox.h"
    #include "hilma/types/Mesh.h"
    #include "hilma/types/Polyline.h"
    #include "hilma/ops/compute.h"
    #include "hilma/ops/generate.h"
    #include "hilma/ops/convert.h"
    #include "hilma/ops/intersection.h"
    #include "hilma/ops/transform.h"
    #include "hilma/ops/raytrace.h"
    #include "hilma/ops/earcut.h"
    #include "hilma/io/ply.h"
    #include "hilma/io/tinyply.h"
    #include "hilma/io/stl.h"
    #include "hilma/io/tiny_obj_loader.h"
    #include "hilma/io/obj.h"
    #include "hilma/io/png.h"
    #include "hilma/io/stb_image.h"
    #include "hilma/io/stb_image_write.h"
    #include "hilma/io/hdr.h"
%}

%include "glm.i"
%include "numpy.i"
%init %{
    import_array();
%}

%typemap(in) (size_t _index){
    $1 = PyInt_AsLong($input);
}

%typemap(in) uint16_t {
    $1 = PyInt_AsLong($input);
}

%typemap(in) uint32_t {
    $1 = PyInt_AsLong($input);
}

%apply (int* IN_ARRAY1, int DIM1 ) {(const int* _array1D, int _n )};
%apply (int* IN_ARRAY2, int DIM1, int DIM2 ) {(const int* _array2D, int _m, int _n )};

%apply (uint16_t* IN_ARRAY1, int DIM1 ) {(const uint16_t* _array1D, int _n )};
%apply (uint16_t* IN_ARRAY2, int DIM1, int DIM2 ) {(const uint16_t* _array2D, int _m, int _n )};

%apply (uint32_t* IN_ARRAY1, int DIM1 ) {(const uint32_t* _array1D, int _n )};
%apply (uint32_t* IN_ARRAY2, int DIM1, int DIM2 ) {(const uint32_t* _array2D, int _m, int _n )};

%apply (float* IN_ARRAY1, int DIM1 ) {(const float* _array1D, int _n )};
%apply (float* IN_ARRAY2, int DIM1, int DIM2 ) {(const float* _array2D, int _m, int _n )};

%include "include/hilma/types/Ray.h"
%include "include/hilma/types/Line.h"
%include "include/hilma/types/Material.h"
%include "include/hilma/types/Triangle.h"
%include "include/hilma/types/Plane.h"
%include "include/hilma/types/BoundingBox.h"
%include "include/hilma/types/Mesh.h"
%include "include/hilma/types/Polyline.h"
%include "include/hilma/types/Image.h"
%include "include/hilma/ops/compute.h"
%include "include/hilma/ops/generate.h"
%include "include/hilma/ops/convert.h"
%include "include/hilma/ops/intersection.h"
%include "include/hilma/ops/raytrace.h"
%include "include/hilma/ops/transform.h"
%include "include/hilma/io/ply.h"
%include "include/hilma/io/stl.h"
%include "include/hilma/io/obj.h"
%include "include/hilma/io/obj.h"
%include "include/hilma/io/png.h"
%include "include/hilma/io/hdr.h"

using namespace hilma;

namespace std {
    %template(VectorString) vector<string>;
    %template(VectorTriangles) vector<Triangle>;
    %template(VectorLines) vector<Line>;
    %template(VectorMesh) vector<Mesh>;
};


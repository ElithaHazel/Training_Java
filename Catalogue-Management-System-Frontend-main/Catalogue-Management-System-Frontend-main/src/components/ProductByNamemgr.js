// import React, { useState } from "react";
// import UserService from "../services/user.service";

// const ProductByNamemgr = () => {
//   const [productName, setProductName] = useState("");
//   const [product, setProduct] = useState(null);
//   const [error, setError] = useState(null);

//   // Function to fetch product by name
//   const getProductByName = async () => {
//     try {
//       const response = await UserService.getproductbynamemgr(productName);
//       if (response.data) {
//         setProduct(response.data);
//         setError(null); // Reset error state if successful
//       } else {
//         setProduct(null); // Clear product if product is not found
//         setError('Product not found.'); // Set error message if product is not found
//       }
//     } catch (error) {
//       console.error('Error fetching product:', error);
//       setProduct(null); // Clear product if error occurs
//       if (error.response && error.response.status === 404) {
//         setError('Product not found.'); // Set error message if product is not found (HTTP 404)
//       } else {
//         setError('An unexpected error occurred.'); // Set generic error message for other errors
//       }
//     }
//   };

//   return (
//     <div className="container">
//       <h2 className="mt-4">View Product By Name</h2>
//       <div className="input-group mb-3">
//         <input
//           type="text"
//           className="form-control"
//           placeholder="Enter product name"
//           value={productName}
//           onChange={(e) => setProductName(e.target.value)}
//         />
//         <div className="input-group-append">
//           <button
//             className="btn btn-outline-secondary"
//             type="button"
//             onClick={getProductByName}
//           >
//             View Product
//           </button>
//         </div>
//       </div>
//       {error && <p className="mt-4 text-danger"> {error}</p>}
//       {product && (
//         <div>
//           <h3>Product: {product.name}</h3>
//           {product.features.map(feature => (
//             <div key={feature.id}>
//               <h4>Feature: {feature.name}</h4>
//               <ul>
//                 {feature.parameters.map(parameter => (
//                   <li key={parameter.id}>
//                     {parameter.name}: {parameter.value} ({parameter.type})
//                   </li>
//                 ))}
//               </ul>
//             </div>
//           ))}
//         </div>
//       )}
//     </div>
//   );
// };

// export default ProductByNamemgr;
import React, { useState, useEffect } from "react";
import UserService from "../services/user.service";

const ProductByNamemgr = () => {
  const [productName, setProductName] = useState("");
  const [products, setProducts] = useState([]);
  const [selectedProduct, setSelectedProduct] = useState(null);
  const [error, setError] = useState(null);

  // Function to fetch all products
  const fetchProducts = async () => {
    try {
      const response = await UserService.getallmgr(); // Assuming a service function to fetch all products for manager
      if (response.data) {
        setProducts(response.data);
      } else {
        setProducts([]);
      }
    } catch (error) {
      console.error('Error fetching products:', error);
      setProducts([]);
      setError('Failed to fetch products.');
    }
  };

  useEffect(() => {
    fetchProducts();
  }, []); // Fetch products on component mount

  // Function to fetch product details by name
  const getProductByName = async () => {
    try {
      const response = await UserService.getproductbynamemgr(productName); // Replace with actual service function
      if (response.data) {
        setSelectedProduct(response.data);
        setError(null);
      } else {
        setSelectedProduct(null);
        setError('Product not found.');
      }
    } catch (error) {
      console.error('Error fetching product:', error);
      setSelectedProduct(null);
      if (error.response && error.response.status === 404) {
        setError('Product not found.');
      } else {
        setError('An unexpected error occurred.');
      }
    }
  };

  return (
    <div className="container mt-4">
      <div className="row justify-content-center">
        <div className="col-md-6">
          <div className="card p-4 rounded">
            <h2 className="mb-4">View Product By Name</h2>
            <div className="input-group mb-3">
              <select
                className="form-control"
                value={productName}
                onChange={(e) => setProductName(e.target.value)}
              >
                <option value="">Select a product</option>
                {products.map((product) => (
                  <option key={product.id} value={product.name}>
                    {product.name}
                  </option>
                ))}
              </select>
              <div className="input-group-append">
                <button
                  className="btn btn-outline-primary"
                  type="button"
                  onClick={getProductByName}
                >
                  View Product
                </button>
              </div>
            </div>
            {error && <p className="mt-2 text-danger">{error}</p>}
            {selectedProduct && (
              <div className="mt-4">
                <h3>Product Name: {selectedProduct.name}</h3>
                {selectedProduct.features && selectedProduct.features.length > 0 && (
                  <div>
                    <h4>Features:</h4>
                    <ul className="list-group">
                      {selectedProduct.features.map((feature) => (
                        <li key={feature.id} className="list-group-item">
                          <strong>{feature.name}</strong>:
                          <ul className="list-group">
                            {feature.parameters.map((parameter) => (
                              <li key={parameter.id} className="list-group-item">
                                <strong>{parameter.name}</strong>: {parameter.value} ({parameter.type})
                              </li>
                            ))}
                          </ul>
                        </li>
                      ))}
                    </ul>
                  </div>
                )}
              </div>
            )}
          </div>
        </div>
      </div>
    </div>
  );
};

export default ProductByNamemgr;

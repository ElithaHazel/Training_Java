import React, { useState, useEffect } from "react";
import UserService from "../services/user.service";

const ViewAllproductsuser = () => {
  const [products, setProducts] = useState([]);
  const [error, setError] = useState(null);
  const [showAllProducts, setShowAllProducts] = useState(false);
  const [expandedProductId, setExpandedProductId] = useState(null);

  // Function to fetch all products
  const getAllProducts = async () => {
    try {
      const response = await UserService.getallbyuser();
      setProducts(response.data);
    } catch (error) {
      console.error("Error fetching products:", error);
      setError("Error fetching products");
    }
  };

  useEffect(() => {
    // Fetch all products when component mounts
    getAllProducts();
  }, []);

  // Function to toggle showing all products
  const handleShowAllProducts = () => {
    setShowAllProducts(true);
  };

  // Function to toggle showing all features for a product
  const toggleProductDetails = (productId) => {
    if (expandedProductId === productId) {
      setExpandedProductId(null); // Collapse if already expanded
    } else {
      setExpandedProductId(productId); // Expand clicked product
    }
  };

  return (
    <div className="prod-container">
      <h2 className="text-center mb-4 font-weight-bold">Our Products</h2>
      {error && <p className="text-danger">{error}</p>}
      <div className="row row-cols-1 row-cols-md-2 row-cols-lg-4 g-4">
        {products
          .slice(0, showAllProducts ? products.length : 4)
          .map((product) => (
            <div key={product.id} className="col">
              <div className="card h-100">
                <div className="card-header">
                  <h3 className="card-title">{product.name}</h3>
                </div>
                <div className="card-body">
                  {/* Displaying only the first feature and its parameters */}
                  {product.features && product.features.length > 0 && (
                    <div key={product.features[0].id} className="mb-3">
                      <h4 className="mb-2">{product.features[0].name}</h4>
                      <ul className="list-group">
                        {product.features[0].parameters.map((parameter) => (
                          <li key={parameter.id} className="list-group-item">
                            {parameter.name}: {parameter.value} (
                            {parameter.type})
                          </li>
                        ))}
                      </ul>
                    </div>
                  )}
                  {/* View More Details button */}
                  <div className="text-center mt-3">
                    <button
                      className="btn btn-secondary"
                      onClick={() => toggleProductDetails(product.id)}
                    >
                      {expandedProductId === product.id
                        ? "Show Less Details"
                        : "View More Details"}
                    </button>
                  </div>
                  {/* Displaying all features if expanded */}
                  {expandedProductId === product.id &&
                    product.features &&
                    product.features.length > 1 && (
                      <>
                        {product.features.slice(1).map((feature) => (
                          <div key={feature.id} className="mb-3">
                            <h4 className="mb-2">{feature.name}</h4>
                            <ul className="list-group">
                              {feature.parameters.map((parameter) => (
                                <li
                                  key={parameter.id}
                                  className="list-group-item"
                                >
                                  {parameter.name}: {parameter.value} (
                                  {parameter.type})
                                </li>
                              ))}
                            </ul>
                          </div>
                        ))}
                      </>
                    )}
                </div>
              </div>
            </div>
          ))}
      </div>
      {/* View More Products button */}
      {!showAllProducts && products.length > 4 && (
        <div className="text-center mt-3">
          <button
            className="btn btn-primary"
            style={{ backgroundColor: "#007bff" }}
            onClick={handleShowAllProducts}
          >
            View More Products
          </button>
        </div>
      )}
    </div>
  );
};

export default ViewAllproductsuser;

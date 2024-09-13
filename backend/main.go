package main

import (
	"database/sql"
	"encoding/json"
	"log"
	"net/http"

	_ "github.com/go-sql-driver/mysql"
)

var db *sql.DB

func init() {
	var err error
	db, err = sql.Open("mysql", "root:younes1629@tcp(127.0.0.1:3306)/hackathon")
	if err != nil {
		log.Fatal(err)
	}
}

// Middleware to handle CORS
func corsMiddleware(next http.Handler) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		w.Header().Set("Access-Control-Allow-Origin", "*")
		w.Header().Set("Access-Control-Allow-Methods", "GET, POST, OPTIONS")
		w.Header().Set("Access-Control-Allow-Headers", "Content-Type")
		if r.Method == http.MethodOptions {
			return
		}
		next.ServeHTTP(w, r)
	})
}

func getProblemsHandler(w http.ResponseWriter, r *http.Request) {
	query := `
        SELECT problem_name, problem_description, expected_function, expected_test, expected_output
        FROM my_problems
        WHERE release_time <= NOW() AND release_time >= NOW() - INTERVAL 30 MINUTE
    `
	rows, err := db.Query(query)
	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}
	defer rows.Close()

	var problems []map[string]interface{}
	for rows.Next() {
		var problemName, problemDescription, expectedFunction, expectedTest, expectedOutput string
		if err := rows.Scan(&problemName, &problemDescription, &expectedFunction, &expectedTest, &expectedOutput); err != nil {
			http.Error(w, err.Error(), http.StatusInternalServerError)
			return
		}
		problems = append(problems, map[string]interface{}{
			"problem_name":        problemName,
			"problem_description": problemDescription,
			"expected_function":   expectedFunction,
			"expected_test":       expectedTest,
			"expected_output":     expectedOutput,
		})
	}
	jsonResponse, err := json.Marshal(problems)
	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}
	w.Header().Set("Content-Type", "application/json")
	w.Write(jsonResponse)
}

func main() {
	mux := http.NewServeMux()
	mux.HandleFunc("/problems", getProblemsHandler)
	http.ListenAndServe(":8081", corsMiddleware(mux))
}
